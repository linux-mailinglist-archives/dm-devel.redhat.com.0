Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AA25A68F
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:24:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-QuymBz-POZ-0hOc6tU4eXA-1; Wed, 02 Sep 2020 03:24:43 -0400
X-MC-Unique: QuymBz-POZ-0hOc6tU4eXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929E91DDF6;
	Wed,  2 Sep 2020 07:24:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED705DA6A;
	Wed,  2 Sep 2020 07:24:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26CA7180B656;
	Wed,  2 Sep 2020 07:24:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827OZPg027968 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F6292156A36; Wed,  2 Sep 2020 07:24:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4942D2157F45
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2059887EF93
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:33 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-FMPXHdf2P5isbcT9PdBEGQ-1; Wed, 02 Sep 2020 03:24:31 -0400
X-MC-Unique: FMPXHdf2P5isbcT9PdBEGQ-1
IronPort-SDR: iZA1NX4xGEX2tGQVEnUXM6v/RszU037qLisN/oD5kEqcWtAHPCeqP+xiGYfNRHvHbSOnUegy/t
	eG3HAdmT9GjkNYxacQdy1fxH0NEsN354NLii2CMUnu5uy8xGE6y7usxhvnHYtRzS+6EN5ev3DM
	ZYdg5bFnF0k9rBgdQbWSRGWm+2z0nUnMhtUkBwf49q8gB23O3EOgIec3M8bQFwBkqOVI+ZZBO3
	sX13NIl22igX5DZj9ogvJVqQzX0Tcgv8Ch5ebj4x7pcTs3HMXgorgaK1s1X3vcArwgMapCShYP
	6sA=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="255918286"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:23:26 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3966.namprd04.prod.outlook.com
	(2603:10b6:805:48::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Wed, 2 Sep 2020 07:23:25 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:23:25 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 4/9] block: add a new revalidate_disk_size helper
Thread-Index: AQHWgHkHpPMQqO6xLU+e8pkytfnbLA==
Date: Wed, 2 Sep 2020 07:23:25 +0000
Message-ID: <SN4PR0401MB35985F2B6C51B7C5027A636A9B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-5-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69ff8bf9-9625-4006-fd36-08d84f111505
x-ms-traffictypediagnostic: SN6PR04MB3966:
x-microsoft-antispam-prvs: <SN6PR04MB396665A7C92AC855B3F8521D9B2F0@SN6PR04MB3966.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hgwi3BfWhnnnDgIkp4JinEsRPsE9l/yp8NCvdT7W6LJBOoaGMIOiRWpIxbuZbKjS9fQp8Vx/GfBCs3NdvuK2i7CNXGzLM725FuN3jB9/uvEsOYrNJ6FdwaAY8HIYCKbmGAp8zuRGXHHn3rMwpE9+2seFjIB6vv2SSYkf9y+xFqEjdUh4Nz5KcBiAafed/fA/axjnlt74UVOFiWCPHIDqTZmEbE1J1Fom2fvlutbZpVgmqeMlB9YPaSpdK6/04ccMfYnco0qoVCGA8OGGwx6NKxNIwd9iElv8z+Uztf3VkmiVGO1em6jird+TPQAxKJL6tgXwKOsS/DRf0GMEVYqstA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(55016002)(4270600006)(8676002)(110136005)(54906003)(86362001)(8936002)(186003)(478600001)(2906002)(6506007)(19618925003)(7696005)(52536014)(316002)(558084003)(71200400001)(33656002)(66476007)(7416002)(66946007)(5660300002)(76116006)(9686003)(4326008)(66446008)(91956017)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: vFNLHs9b/kHj2fYG590roNRfcL1zbCslxrK2eVoil5j0AK565ejnlNmH5xKU9d/qL7938mcPHoDIytiL6QUvAjDmo3imZfkgrzu0BgVzHTlf7nAPoclVZwDELdZ+11YmcUVEztgDcDnOozwhMtVTazfIrhKEJp2tqJNTfCb4QLHY2WOI3NGsZZbpoh12khwHU7M21d1QwufhmT90SlI+2RiWutthWMgxOM0hmbLpMry2GzuK/0PChKAUrLyDyU5eUKhfpyWXpwUA14QTsrrKq3B6ibO+Ro+ECQhZXGNK+po2c7jNT3N1aZGjMIfFpoNB1c4gjTV5dHBQJdq6VX2eppQcBBStwquSfjW8jj4GLNIdv74oJEOIxZ8zUdzcPjhjFHE7qecXooGNqNiKwL0W0fDiYGPxofmApMclzC2c6Uu+YQx1+uf99riMDPzEloiK/EYuZ74RXmxn6CaWiboYFPp7vlq29BY/xFcE/YJ5O00wSOVbn1W4HKwKPRgDO5+7VUga1dw7F88u6Y8Z/jFQVw0KuFQfNB6zvgVFX2Hc5vkoDwVmu3M+7WC3mrSpEK4IXKL28fsBAxXNylrOTWB8IhzIt+QLOXRy0zZSYUn6myBSJ4UuPsZWoKmZvSfxSXETjOgELSEyqZluB3AjF/wHK/hDOne/w58Cax7cBVCdSD3x0251lgqfR8Zwr72JxuRpZY0DT6vQue1l/gZpNkAyxg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ff8bf9-9625-4006-fd36-08d84f111505
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:23:25.7788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSCYLg1WwyTg/4+RKE47zQdd/De9ENoFOHq1+cShPscgTp4vBJU1xTwIdaMHtqE873+RA9d83BOEusc2S7rOhb4WCX5rcvtCHk6TkhLjZ7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3966
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827OZPg027968
X-loop: dm-devel@redhat.com
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 4/9] block: add a new revalidate_disk_size
	helper
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

