//
//  Assembly.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

protocol Assembly {
    associatedtype Module: UIViewController
    func configure() -> Module
}

private class _AnyAssemblyBox<Module>: Assembly where Module: UIViewController {
    func configure() -> Module {
        fatalError("This method is abstract")
    }
}

private class _AssemblyBox<Base: Assembly>: _AnyAssemblyBox<Base.Module> {
    private let _base: Base

    init(_ base: Base) {
        _base = base
    }
    
    override func configure() -> Base.Module {
        return _base.configure()
    }
}

struct AnyAssembly<Module>: Assembly where Module: UIViewController {
    private let _box: _AnyAssemblyBox<Module>
    
    init<AssemblyType: Assembly>(_ assembly: AssemblyType) where AssemblyType.Module == Module {
        _box = _AssemblyBox(assembly)
    }
    
    func configure() -> Module {
        return _box.configure()
    }
}
