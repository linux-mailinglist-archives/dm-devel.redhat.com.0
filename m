Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E865825A6AB
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:25:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-_DWrINgVOfO0OOpQgy2L0g-1; Wed, 02 Sep 2020 03:25:41 -0400
X-MC-Unique: _DWrINgVOfO0OOpQgy2L0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53AE8801AAE;
	Wed,  2 Sep 2020 07:25:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C5F508E8;
	Wed,  2 Sep 2020 07:25:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA6A9180B655;
	Wed,  2 Sep 2020 07:25:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827PW9t028128 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:25:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CBF52156A3A; Wed,  2 Sep 2020 07:25:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 672522156A38
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:25:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D0C98007A4
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:25:30 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-v0ve-tAUNde1JhPBBomZBQ-1; Wed, 02 Sep 2020 03:25:28 -0400
X-MC-Unique: v0ve-tAUNde1JhPBBomZBQ-1
IronPort-SDR: fXJETAcNQLN7LEW7VpJYhBjGKo7gZ7wKCRkpHIeQWNg6YWpSvmXvjeFax5RC5M9pEhVD63Nv6C
	VLxrIgtl4qDdoHxwiVWobhBvn2+jo/RP0wRUB6N1EJFj9ohUlJu8Efi1gA1PmgBjKKI/oHIXLY
	hmvGhRTgfUI0KYj7v5UEau64H90BxuKe8uQHTKTroOmIrcuNtuPSKVmJmN+RkiR4XrMJ7S1X2+
	oByl2eZ2K2yyupZt46GJNXR2ckVRzBxlf/QKT0enddBtX9cHuEqRQUzNOuz8C13P8dwq1ZEuur
	wxQ=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="150728301"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:25:26 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4238.namprd04.prod.outlook.com
	(2603:10b6:805:2c::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19;
	Wed, 2 Sep 2020 07:25:24 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:25:24 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 9/9] block: remove revalidate_disk()
Thread-Index: AQHWgHjsV9Wx4QVWTUmpDJeETk/HdA==
Date: Wed, 2 Sep 2020 07:25:24 +0000
Message-ID: <SN4PR0401MB3598AEA05439AFC90EC56A5B9B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-10-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56a9516e-9407-4c12-2214-08d84f115bf4
x-ms-traffictypediagnostic: SN6PR04MB4238:
x-microsoft-antispam-prvs: <SN6PR04MB4238A60483B44842DE54E14F9B2F0@SN6PR04MB4238.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +QuZyk93hFCG+4OoRyiTp8yfdan5CCNsg1rveJPbezwv4RfQDVnNUewO8TCxY4Ojzk2wzTjVGEUyvlY9Eirbpu7ayh9JdAfZO8gq2MFhNyR8HEAqTO2ity+LzQ418vLBkwwnHU6UC5beXkShDrK37fThx0P7fxGBAcfTe635uUeZr/HnakuXd3Ovi3B2Eewza580RmLcoFeN8GNRPosL7i8bLRg8ciJ84I8mpI6mE65Z3dqhSy1YE6Hn2HlXUdF2Rvgy6973iivq/FCpb+60WuOm3qd8YDdUHda/CdC/qaw3xvEjDVKjB50M2ybJsMIKW9+bWt7h29t4YdBsIC+Wfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(7416002)(2906002)(19618925003)(76116006)(8936002)(5660300002)(558084003)(66946007)(33656002)(91956017)(86362001)(66556008)(7696005)(64756008)(66446008)(66476007)(316002)(52536014)(8676002)(9686003)(71200400001)(186003)(6506007)(54906003)(478600001)(4270600006)(4326008)(55016002)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: yYWhuFO3+1mVufL+7/XDMetN8PFJUrNbHwiKu3VgtUw3teOPU9Gdef21UCo/B8dWn7/i3WN4PSaiMwg5r5suGsCwCqs53dcz4PixltVNvR+X3H4cCtWV07CseGuH1VnTXZJhX6/UKc2WcUNLp4gAwIE05kRG02yVo92oXcQ2E9yyZdIXrKdORjJ+tGRK8CEKXD2QWrSDPo55VXGi6K6hbRHY3mJdFsgDF8uibBcz2Jl29RypT2/39fU0RW9wL0z9bINjNUZeQdl2wmMjH5RhivQJg4CmQCR8VWnluy5G2Ud61BOo8tJ3L0wQLXCgjXA5IeAqrqIClEyG2d2GKEk+dNTGy4E2qJbEnMd7IcPLoCuJEBjpg7aWVofIZM+oBxxL1MLJFXyqCBMxm9L0I7ZXarr819sTr03OYPKC10vE0Efk/HGZnJsXRFy2+yYlk4uUre4YqV55/R5iKZWkomR3mnLUQJ5t301jzIxzx27daveW/Iks1Q9jAMz4UN/1Wgwel+h8gM36QBit8ZM7gNkru9xBrs9Al+JincBBmdbQ/3NkjsyMePwluJZJh38Z6/3oKgwevqIyOueV7IYnyzRZDmUjW/dBp4mUx3sw4Hhv75KJlIyVh1EJc3F20Hjy0qetGrzbMrpYymC2zRBH8hz9nxkkQWBW3BscPlmdACymSjk9f7SVjXxA9QmFmRj7VTU2cZHceFtEdoraJz3s5CAfKw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a9516e-9407-4c12-2214-08d84f115bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:25:24.7140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jDmRTD2XeJ1WDCANZ3s9tarIUmEgrjdIo6AcCx+DZ4GZjVbbGdD5wBDIkV4JblgCahOC8m6otLDhimciYzeBWSWiKAiL8J2qvtUilvhsik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4238
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827PW9t028128
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
Subject: Re: [dm-devel] [PATCH 9/9] block: remove revalidate_disk()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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

