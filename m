Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3892F2292A4
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:56:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-tZmSwxYlPXmAywwRAZcbtw-1; Wed, 22 Jul 2020 03:56:08 -0400
X-MC-Unique: tZmSwxYlPXmAywwRAZcbtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A89100CCC7;
	Wed, 22 Jul 2020 07:55:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BAA45D9D5;
	Wed, 22 Jul 2020 07:55:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D5C21809554;
	Wed, 22 Jul 2020 07:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M6t19H012982 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 02:55:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9223D2097D60; Wed, 22 Jul 2020 06:55:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D0652026D5D
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 06:54:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BDE480CC26
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 06:54:59 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-80-ivRi-p1oOm6OF9Pm1EbXLQ-1; Wed, 22 Jul 2020 02:54:57 -0400
X-MC-Unique: ivRi-p1oOm6OF9Pm1EbXLQ-1
IronPort-SDR: uX+mFOpiJ5WMYTqXRu+hTctVIkQQVPELRznVVqhpeCyEHEb1Zf62pe2bHdyuJRm1QYvBhvpj1J
	ixBPaAauYQgKN2rXhZiUVjFyQlhLBvfDgej4mWGNOM+4TTNeqN2af2ROTHlZtr7gZIdcMaCAtO
	5DfX7AMaQXIMxOx6lRa1qQA4elkNt5o8eKzW6nk1YEhCET3LkVTLe8mWhOZcFcQiTB2fzrRdLz
	YPf7t3FZeshKUuaLFO04C+3gAnEHsgeX56PprMQ4XnVngJakjnu9vTTzWFt6DwjrRD/AfcrzRo
	i34=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="252373980"
Received: from mail-bn3nam04lp2055.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.55])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 14:54:54 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2240.namprd04.prod.outlook.com
	(2603:10b6:804:e::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20;
	Wed, 22 Jul 2020 06:54:53 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 06:54:53 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 01/14] fs: remove the unused SB_I_MULTIROOT flag
Thread-Index: AQHWX/FDB40tZCzWM0ydmrzWX6HQ7w==
Date: Wed, 22 Jul 2020 06:54:53 +0000
Message-ID: <SN4PR0401MB35987802444E56DED8C7962E9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3cc6b058-e96d-4554-6048-08d82e0c22d7
x-ms-traffictypediagnostic: SN2PR04MB2240:
x-microsoft-antispam-prvs: <SN2PR04MB2240AB2AA052BBB77780AF6C9B790@SN2PR04MB2240.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IDVmgvohX7JSexygYWy/gOHLtmMk0pYHg3OX93VX4WVrXR65igCwUFOiXSy/YcISEyC7S0LenThZvvTH9Hqkk+fQau0x5DI1D1sbJVBh/l+YrP8SC5QWxSGnldIeXgpYPqugyHzQB7wFu4DigmF/me5aKVWY0rlmCBvv0rTHC734WzcPVwj7aVwS+NElirKkzg+9psne5MLJmhk3C1LBqOcKncYE4m3x6wA/PYSywbjqs0ApTbT+OvQVgIrAcIsNdhCkjg985Ybvj9EFf/kSyzU39aRCGcCUf518jWY9NjQn0Pkr54KW+xf4ZnRMHYzD3l6vgLoOkwNi+OY1LT+5ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(71200400001)(558084003)(26005)(55016002)(478600001)(5660300002)(186003)(4326008)(6506007)(86362001)(8936002)(7696005)(33656002)(316002)(9686003)(8676002)(52536014)(66446008)(66556008)(64756008)(66476007)(76116006)(91956017)(66946007)(110136005)(2906002)(7416002)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: /27ro/TwgT3wmbz0gAlm/4yMGrMf4LxlNA6yKwS5muEQ3saFOCMlIP9lXn+bFE9pvh4/VSnXeAY3rlcMF6crS/VEU7Isdj3HpOGtaoEhESyOPpRo3Fe1STSm6+ntmFL9CnOwK5AT0Opvr+PMEmuDCeX1lTQW2IukYQ1T/XeTpCWeTELZEkx8XU50UWQQudQ3yQCOT0f5Pxc94V430bSiN3kgIwxexGTTHCkOV6wAphyDdraAbFl+EQkXfe7rJjBEsAcR+mb1OnGRYAV8Vqqj9QguxWjdICi7uhRITSy347pRdN9omKPKgmq1siH3iXrLThmW/sdd/Nkh6iqQNXOOjXwgw9noWKwhU8T1CWTdmRbw69QbYFSod+f9AFDWHevcQ3OvPk5lgHEnxITJUawsu5A/prRcUAZpyIkzGcnr9z5Rs1/t8zvhcu92nydjtdaq2hN4n2FRnSMGd4fAxp1dC2C5y3dAnTknVwgRMaQtGuBXPEHJxibYGi5ipPtwZgzN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc6b058-e96d-4554-6048-08d82e0c22d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 06:54:53.0951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sK+zFm6//NsZ55QHbWcTkYXPaG6cMYoVQJQvSJlfcuZOIe5XRjNhiHNd+wkavDlBO3CLZbvQ0i0elGFSi5k1hA8123AIETr4T8yBNiqiEsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2240
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M6t19H012982
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
Subject: Re: [dm-devel] [PATCH 01/14] fs: remove the unused SB_I_MULTIROOT
	flag
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A little bit of git archeology shows the last user of SB_I_MULTIROOT is gone with
f2aedb713c28 ("NFS: Add fs_context support.")

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

