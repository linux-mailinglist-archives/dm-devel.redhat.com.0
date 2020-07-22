Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AD1AC229256
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:40:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-iQdNq8cCOuO4h75YyAeTLQ-1; Wed, 22 Jul 2020 03:40:06 -0400
X-MC-Unique: iQdNq8cCOuO4h75YyAeTLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D0A1DE4;
	Wed, 22 Jul 2020 07:40:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6933E69316;
	Wed, 22 Jul 2020 07:40:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20682730D7;
	Wed, 22 Jul 2020 07:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M7KTnY015025 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:20:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C753F885D; Wed, 22 Jul 2020 07:20:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1CB7F885F
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:20:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F2A2800296
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:20:26 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-me96njYMMt-Evya4E1P0Eg-1; Wed, 22 Jul 2020 03:20:22 -0400
X-MC-Unique: me96njYMMt-Evya4E1P0Eg-1
IronPort-SDR: X/QBfi9oXs2oNzvdjBDNnaSbKu0sKJMDEpkSBxQVvuYugvRnjkwZVLriexDuoP7hdfcgOZzSx6
	txe7hy4mHx9YSrwl2kAPb07/v+9geyDn/pNZf7shrCEuIGM/NL2emjUtFgY/hfMCJQ6XhajPXJ
	qOb/LQD9hdvirZPXBg0RR1474sazrVi8jPNDbmByv7o/ET+dr4R2qoyeptIy7gYvmx2R1Ip3Px
	MczbKlcxio2bcqllKzCJYjZ7HQkImZBDEjgVVxUuDpidSB4Ji4moRagA4NMnWpdSBOaeXtHRTT
	TDc=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="143089024"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:20:19 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB5328.namprd04.prod.outlook.com
	(2603:10b6:805:fe::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22;
	Wed, 22 Jul 2020 07:20:18 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:20:18 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 08/14] block: add helper macros for queue sysfs entries
Thread-Index: AQHWX/E6SMPB6kgBPUaskZWzXZRPyw==
Date: Wed, 22 Jul 2020 07:20:18 +0000
Message-ID: <SN4PR0401MB3598294D373946F23B521D0E9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-9-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb0b06ec-45be-4edd-6605-08d82e0fb017
x-ms-traffictypediagnostic: SN6PR04MB5328:
x-microsoft-antispam-prvs: <SN6PR04MB5328B9E9862809E1DA6C145C9B790@SN6PR04MB5328.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TX4ij0rdNFb7KSO6vRl1tFUjA9Dg0oQNIaD3K6RkI0euOniyvdiiiSutx1IVwB1oxtjXpiMrqbCQG2+o1eQYyhCUHsCmFJEu6XftayBTfSryHtmUUzGjvaPsfEPZXfRDvGomfY6ipjcTvQrJrNiV2vhF7wGd2BaZwik3p4N/kHA/gpwPJjC58IW45YAlva/YAyPbvBNkavyoXWsG0fnYgqzdFqYdneHJBOBX7eIqq4Q/CD2BGmPU/F6KANpWbw3JXzc7pjywDVv52acDGvY3LGFlVJG+64D9lPwjQKG79vUPHJQyI/FC44SGtY3JY0ouxz9z5a6ESELqYOA13HSegQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(478600001)(64756008)(91956017)(7416002)(66946007)(76116006)(66476007)(66556008)(66446008)(33656002)(2906002)(19618925003)(7696005)(6506007)(4270600006)(55016002)(558084003)(4326008)(26005)(186003)(9686003)(8676002)(52536014)(86362001)(5660300002)(110136005)(54906003)(316002)(71200400001)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: uxkebodhmSxir3MbaHc4mgxd3LNWJq49AlIYKwNQ7w4Xz8FnWPi/9Yp1akLDh3pK+CoaqYLxJaZrMdL3uQo7PjbxvdZTuybC3vz/wCtZ76RLMPXTuxBNRegvaztz/na51K57xXELrcdzUAp6TI6LUDlRpPgnUUV9qaJ5hevPQAH2H4VPnJBZkgPmhigWxqcJRJfVAdynXRO8WTzl99sWaLrC7QJ3H2GAiucK+UJlx7GcwLgCTTRgQOLluHtm9SoJ+RMIxHfBDICXRPxDQjM/xZgjZV4wYDFCVTXwT8vHUY8r1IYrjq2gp2H/4o8UqF2d2nQ1QdbZLxI2xZWl4OLQH31tXedCe320SEh0XZKr5/tds3zT7VF+55UHIkiHHlHd5nuf755bLMPdVhfXT6MWzj3Q7vizgs+MZFcWiONo5GMa6a/xZ/oM+NFMOryXyIxRl//q7eRsTmLjGFalmunYw5Br87eOyspaxyf4AZVDtPL2NPCBAbxUoVx5O6hVKEAV
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0b06ec-45be-4edd-6605-08d82e0fb017
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:20:18.5206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYhn7lcWKLN+WIysS/xbEyEK9O0zI2quM3KrmzBuTvmyr0V4ebcNx0bGoyEr7IrI2UqHlIRKNXc/sP5k3AN5At1FdXccLUzEU9JvbWk0J+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5328
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M7KTnY015025
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jul 2020 03:31:58 -0400
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Richard,
	Minchan Kim <minchan@kernel.org>, Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 08/14] block: add helper macros for queue
	sysfs entries
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

