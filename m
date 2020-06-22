Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 22601203256
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=42lknhPwxl/6BQ7M8rrt3ZE6zJsvqBFj/aVcqHi5Xdg=;
	b=azqqaoyv9PASGEwM584vAZo2dNarfWGEkxQ8XYiMSKKdEaEQzSF3AvYSY3yHtt3hkCHTPY
	o/fLwFEgnOGHe2VUFV1AXHiLN/sU/RlryzhsufnfR4bNbIGl8I2mrj+jHPf5anNqucqO0g
	GkGI04VHSVXiJcWfGbTjJB1vBwFwwU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-sWFHbgm0OkS5Cjtb9nr1bg-1; Mon, 22 Jun 2020 04:47:34 -0400
X-MC-Unique: sWFHbgm0OkS5Cjtb9nr1bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9579835B47;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA925BACD;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1660A833C3;
	Mon, 22 Jun 2020 08:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M7pMmC028532 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 03:51:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E929110F3B0; Mon, 22 Jun 2020 07:51:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 384AD110F0D9
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:51:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF2541049841
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:51:19 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-304-USu32g0yPs-D79vuPwNd3Q-1; Mon, 22 Jun 2020 03:51:17 -0400
X-MC-Unique: USu32g0yPs-D79vuPwNd3Q-1
IronPort-SDR: iMUoRFawO4OJ9KvwrrbonJrgkndVawzeDfnTS3b8/w5/bIfDSWwzmEZJwK/rsIJN+iOQeDn33y
	CGMW4ZUyJrFJQbVEc8Hf9i4FHmWhHkPSk8JCby+T5uysYbPxU8ZC5cnEEUMhiM+4HrkLsWfHBc
	iUcl0XVQMnMViG/oyyFgvMv/MCOx7Sa3tzynnZCqhLMILJIna1kdVQdKGwMaN4h+1Jy7Fuaaee
	KHw8loDmem8DQT6MjKQ+XETWRFJlcywcj1372FlnKGo61qjlYz5WtvzrkOmwaCyiFLYzOgh5lW
	kh4=
X-IronPort-AV: E=Sophos;i="5.75,266,1589212800"; d="scan'208";a="144908554"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2020 15:51:16 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4397.namprd04.prod.outlook.com
	(2603:10b6:805:36::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25;
	Mon, 22 Jun 2020 07:51:14 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3109.027;
	Mon, 22 Jun 2020 07:51:13 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [RFC PATCH 2/2] dm: don't try to split REQ_OP_ZONE_APPEND bios
Thread-Index: AQHWRgczQDUEpvYNXEqUv7bKhjRaVA==
Date: Mon, 22 Jun 2020 07:51:13 +0000
Message-ID: <SN4PR0401MB35985AA8FE160B3B0417DB3C9B970@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
	<20200619065905.22228-3-johannes.thumshirn@wdc.com>
	<CY4PR04MB37514CDC42E7F545244D66C6E7980@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200619162658.GB24642@redhat.com>
	<CY4PR04MB37514F8CCE7918A7C13FCA82E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1597:de01:e494:6330:3987:7eb6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48e5eef6-28da-4248-0cc1-08d81681098e
x-ms-traffictypediagnostic: SN6PR04MB4397:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4397F41A39E70F9A719981779B970@SN6PR04MB4397.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mL/b+/4vEwk2py38ZvSQbCh2yUET2akqj8lfwU8rYWGbIPUBKAu2IptNs32TeDdgf25h7KFGgoeuP0abgjG31Kx1ySJgjpkD5iUrDt0sPScHB9kMOP89lF1elBmvRDDVptABA5+8NG+WTCHqAaC5Y14Cr2KYV8hqZ2UIhKg5wA8PV0vP7VHfKjtyulaqnc9BGQpG7GvXZdtDGfSJ/eIaDUIDtREdxiSw0CYRB5Y5J6piuqgke2CEGi8ysxb2lcNVx12o62OlBNDEdxXfavZ4Qb8XeK31DV9Z0R/rH31UGIWpL+1k88E2rAx5kSkBgIqALRJnc2rWxTNmKd4zn0HolQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(54906003)(316002)(4744005)(86362001)(5660300002)(110136005)(478600001)(6506007)(55016002)(53546011)(71200400001)(7696005)(9686003)(8676002)(2906002)(66446008)(33656002)(66476007)(66946007)(83380400001)(91956017)(76116006)(66556008)(64756008)(4326008)(8936002)(52536014)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: adB07SJ4VH+7T23a3kAX+6YLx7zE4iYUPjv5qlcm2OdhLLBwOa9P30CZcoQiOBy56bmmbjC9wX51yA6uv/jQMbP2NlrauD1/qkMMQ+OGP9RD7fW8XOG5g6/6J/NoaHKJQ5YPDxLU7SgwkhPmsEdHIogvsXxHXDOVPy1vBr1y3fYJk8h/Q8w6HNvu4dtJJRd4OWG0ztTrdIy6RACHY17a3t1HYku24E676veFTRID+qwJlEN3tp+Sgt1+ncoRSHK1auoVDG4y3Vb3B/vCCPRXXuBZI1zu5T/zoK+cGbtZor3p66p6+nFzdAyDr+jncgMgDF5mxJs12+mylrftg02ti28xcunMu25Kx404Bru89V4VJAAVWcy8cTLwPo2dPBOfpZsW6MobHq2rOQjYi1U7TdC1jx8Gxh/T1Z6g/wSjqeburCIocGBMU2N26w8/ZFmlBvsFO0pcfWdkR/dV81xAhcsO/AV8x07GAzy4CJIpBqeA89DlSfJ1wA5E21y1f9Qom5bsH7yGcxpDKYZw5qRg5iGoJFpCn6VLKZPrxzhgmsDGm91ZK6AsL1ecGTp8sMqX
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e5eef6-28da-4248-0cc1-08d81681098e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 07:51:13.4491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omzyeFwjN+G6LkJr0xHQxIqwYVOfE7ShThCLFe6N2saf2hF1laxdlE4ki9Qamn722yDF8FdxLOe62Konv3n8u5PVGuKYfTg02WLonvPo9iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4397
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05M7pMmC028532
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm: don't try to split
	REQ_OP_ZONE_APPEND bios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/06/2020 02:27, Damien Le Moal wrote:
[...]
> Just to be extra sure, I checked this again. Since for zoned block devices the
> mapping of a target must be zoned aligned and a zone append command is always
> fully contained within a zone, we do not need this check. The stacked limits and
> submit_bio() code will fail a zone append command that is too large or that
> spans zones before we get here.
> 
> That is of course assuming that the target does not expose zones that are mapped
> using multiple chunks from different devices. There is currently no target doing
> that, so this is OK. We can safely drop this patch.

Yeah I think we can drop that one.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

