module.exports = {
    "extends": "@media-factory-cz/stylelint-config",
    "rules": {
        "selector-pseudo-class-no-unknown": [
            true,
            {
                "ignorePseudoClasses": [
                    "global",
                    "export"
                ]
            }
        ],
        "selector-class-pattern": null,
        "max-nesting-depth": 3,
        "no-descending-specificity": null,
        "scss/selector-no-redundant-nesting-selector": null,
        "declaration-block-no-redundant-longhand-properties": null,
        "shorthand-property-no-redundant-values": null
    }
}
