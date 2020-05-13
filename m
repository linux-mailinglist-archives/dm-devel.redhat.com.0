Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 038361D0C90
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 11:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589363092;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6KagL47rllXwNAjlBHlKP20FsjT583tH/nHKySV0BWQ=;
	b=YM2tRMpYJakb1J/NRjJnSMD6uImUyiC6pr45AkzpAFRyzq99Fly1tpD7g8MaejtCIPK7oq
	vLc0A7b1GzQgxE15JPk4vtzcskA0qDrLhYytNYPpgWJmUjq075EznWaKsB3wXAvynxjRqW
	cLu1IcdiI0vinV5IePqQvj76alFRmbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-dB1TZWV-N_C0v4eMdNpAOQ-1; Wed, 13 May 2020 05:44:50 -0400
X-MC-Unique: dB1TZWV-N_C0v4eMdNpAOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8520805721;
	Wed, 13 May 2020 09:44:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F59C1002395;
	Wed, 13 May 2020 09:44:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 021A14CA94;
	Wed, 13 May 2020 09:44:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D9iKnM005116 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 05:44:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FB262156A4C; Wed, 13 May 2020 09:44:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8132156A49
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:44:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 559291859162
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:44:17 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-Qr5S0DsRPdGvRvbtY0Snkw-1; Wed, 13 May 2020 05:44:12 -0400
X-MC-Unique: Qr5S0DsRPdGvRvbtY0Snkw-1
IronPort-SDR: 1rAToIi31P5vHyL6xnVU+e5SaoGRWiTfC6XVOHu2KgcM0owiYj0s8KnxWgRvjUvGoLCAjgCm1X
	uBeBdpELOpjdFsW81tYlPqz9n6RSFNJ2jNeeo51zn+vbr9YsCl8OFcTOBHToz2Ow2rvAuevwQR
	Sgy24N+daRzW/m0166uaj31RuGHNZ98ARDgjSYU7aJvCaqW3aptVmhLyZIpTC1K3zysenld8wJ
	EuKULHfBsiCvWh1Q9pFYg7ceC021M3PxhCmQrN58QT8wn4Il8jbPg7hynxw4M+r5GIy7hiUanj
	Nxk=
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="137907670"
Received: from mail-co1nam04lp2056.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.56])
	by ob1.hgst.iphmx.com with ESMTP; 13 May 2020 17:44:11 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20;
	Wed, 13 May 2020 09:44:10 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Wed, 13 May 2020 09:44:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 0/2] dm-zoned: improve cache performance
Thread-Index: AQHWKPUwSFgEa9RwGU2KIMsh/bFhtw==
Date: Wed, 13 May 2020 09:44:10 +0000
Message-ID: <BY5PR04MB6900A74251B571E454252F66E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513070729.71461-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 812680e7-d053-4a06-fc1c-08d7f7223046
x-ms-traffictypediagnostic: BY5PR04MB6900:
x-microsoft-antispam-prvs: <BY5PR04MB6900CCBFAA5B42775837C857E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PBwQLJ0V5GIiLRYVarS/hEB3jiuoDEdIvRUWKcqN88lQgNvDfP5ATK11vPP9Npy+f+9sf7pm+8ev8oR1RiWqcw+ruVDONZCfsMWXfYDPIbBK2ZsZACtUio5C7BjagHyQzDORqm0FirkZMDA4/B2oZwjMsGd3B+YUF1RdHUkW5zal83eNtu+6WxnOCOOSfhwPSd9udLzxBJkiWYue55zWj8UndzKbTzWDkk0cFXjyEDJTWwLM4QmhktHviQen245UThUkI+ZovSjRrpBcK5af87Pzow/fdTofGGlM8m0ItjmIhG1E8weIeKSPQc79Psuawi2RGsBKT85WqekYO0i9hQ2QuAWXxHUSz0Q/L1A8hWcQKUs1oa75viP8gigApwunjwt0qoj7bg8bO8j17kWqaSaWNnr1IZIVq2IfzzmoXVZ7hBR/pgeyq4MDf7gk6uC8Igv/1Ijp86DWIEHSrKfXeI/Yb5EwxGFeFvXzEtYQUeacpqchfaeoDmx7lKyQ6AKrU065wz45femGAzHEof2hCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(33430700001)(33656002)(5660300002)(76116006)(66946007)(4326008)(33440700001)(7696005)(86362001)(55016002)(8936002)(478600001)(2906002)(9686003)(8676002)(6506007)(64756008)(66556008)(186003)(66476007)(66446008)(316002)(26005)(71200400001)(110136005)(53546011)(52536014);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Ke+XfRwLDg0PRGI0cR0tOMmMG//If44kUx4Gx+1FhewrUU7J33GuZ3SMHn6L2YlDhr2h7HRx6WnQcK59U2AksH5k3wF5PSVSaDGLAKyPzVVIxQveVm78YoLNra6OwRCT1rXtKHsfbkO9FmG7mW1rIlHChFxZkeX3LCCra/t6QGlk6tDo2lOg0k1mqofxGCkIsPkh27AaooxPLP6o+IXz3QdYxgyhJs2wbLTsQcnzL5aqzLp4tE4OLcFgDE9oyLFo+M1VKn4O8yp9qjrh94jUZivTcHEL90mFj3TdTd6NOxATLpzFouIrgqFyPYTH3PTdFHst7Mp63QslZ/CqSXPzS4isULZpvHlMwNYMerwmFdJK1NZSI7I9GmpTaGYWITbq0lYhCTesM2pi/wAbasdTUS0mNCGfAQEgZ712ZaYsUUqAqNcHDAqEB8v8AdadgorhwyZRafuavK+DxdSrOnOR3cvCLhJqIL8Nl6uKeakc8tBY7LqHHBG08tlapt4M9rxU
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812680e7-d053-4a06-fc1c-08d7f7223046
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 09:44:10.5757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fj0Zx7c0B0uJQ79uydZfGZuyxOuLJVmrEdz6rfFETMKtSLXtHpNkIPnQ29BiHg/MmNxmi1FcJxEY2AJgo5TB0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6900
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04D9iKnM005116
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/2] dm-zoned: improve cache performance
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/13 16:07, Hannes Reinecke wrote:
> Hi all,
> 
> here are two patches to improve performance when a regular device
> is specified for dm-zoned.
> Damien noted that we have a performance drop after the zones on the
> regular device are used up, as then the random zones on the zoned
> device are being used, _and_ reclaim is running on the same disk.
> This slows down I/O whle using random zones, increasing again after
> the random zones are used up.
> This patchset fixes this by not allowing random zones for caching
> if a regular device is present.

Awesome ! I will run this overnight to see how it compares with the previous
results I sent.

And I need to send something to fix the setup warning I am seeing, but that is a
block or scsi patch I think. Had no time to dig.

> 
> Patch is relative to the dm-5.8 branch from
> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
> 
> As usual, comments and reviews are welcome.
> 
> 
> Hannes Reinecke (2):
>   dm-zoned: invert zone check in dmz_reset_zone()
>   dm-zoned: split off random and cache zones
> 
>  .../admin-guide/device-mapper/dm-zoned.rst    |  17 +-
>  drivers/md/dm-zoned-metadata.c                | 157 +++++++++++++-----
>  drivers/md/dm-zoned-reclaim.c                 |  70 ++++----
>  drivers/md/dm-zoned-target.c                  |  19 ++-
>  drivers/md/dm-zoned.h                         |   7 +-
>  5 files changed, 189 insertions(+), 81 deletions(-)
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

