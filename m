Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7B212E833A
	for <lists+dm-devel@lfdr.de>; Tue, 29 Oct 2019 09:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572337923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wtyA/IBP7d4P9rXWh86tOMCaW71OgFTlJwmH/sc+BBg=;
	b=B5ehNLHqzN7Nss/Qp88fSuwFmGpFK/x+z0Fv5Li+pypeLmrJMavsXkK7ZotjESh7WsJ7vk
	4NGCRPgrjVQtXINsejzlPnTbM27hhsckpyAsTOQ4YQkucVCuO+v/E59doEA59nMDOD/r7n
	L8Kgx1BUgIRP1NnkWMKwEGkWhzIcvBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-QxCHfdzMPnGpmYhdygtA4w-1; Tue, 29 Oct 2019 04:32:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C625E6;
	Tue, 29 Oct 2019 08:31:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF4160C57;
	Tue, 29 Oct 2019 08:31:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69BA6206CC;
	Tue, 29 Oct 2019 08:31:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9S7o7UP004155 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 03:50:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DF905D6B0; Mon, 28 Oct 2019 07:50:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FE9B5D6A0;
	Mon, 28 Oct 2019 07:49:59 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EB2F4ACDF;
	Mon, 28 Oct 2019 07:49:31 +0000 (UTC)
IronPort-SDR: spCGvcWF4pJTfSXV7c73+uU0+uW2Rs9upAJj3Q5HsGG1N/W0Jep8kx2rZDx71TLag7vQujx0CH
	jvcc42qVI9RBLVBasX8TgSm/gM8qDxL2xZ/wiLCZlyfruVwNngWQJBF98Ef53KXK4pmYPkKGMB
	XyDWm66KAvTMYKTgfLj+5eKF9G7h8b3xSnptunpkwA2Ldeq/OheFzdgntRPgw78xDIH88OrVcC
	bFURBdSJYHEdMUc2n/dPSnhA8RNk5CYooQSuP9RCT6ycIJ2995VKIfG0fDq7wSJlRGqalJcuSJ
	+2g=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125882894"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 15:49:22 +0800
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.57.21) by
	BYAPR04MB4728.namprd04.prod.outlook.com (52.135.239.222) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.23; Mon, 28 Oct 2019 07:49:20 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7%6]) with mapi id 15.20.2387.023;
	Mon, 28 Oct 2019 07:49:20 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL handling
Thread-Index: AQHVjM+qshxVC7ah2EOUEKAVKMXumA==
Date: Mon, 28 Oct 2019 07:49:19 +0000
Message-ID: <BYAPR04MB5749C25A8558C0ED9AB3EA6786660@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-3-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.44.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ea6f626-76af-48a5-937d-08d75b7b576e
x-ms-traffictypediagnostic: BYAPR04MB4728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB4728BAD2B681C6FEE1B2943986660@BYAPR04MB4728.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(199004)(189003)(71190400001)(71200400001)(99286004)(186003)(7696005)(53546011)(2906002)(74316002)(256004)(476003)(5660300002)(86362001)(6506007)(486006)(8936002)(4744005)(66066001)(76176011)(8676002)(52536014)(81166006)(76116006)(81156014)(102836004)(9686003)(4326008)(66946007)(446003)(6436002)(6246003)(2501003)(66556008)(66476007)(55016002)(26005)(64756008)(316002)(54906003)(229853002)(110136005)(305945005)(7736002)(14454004)(25786009)(66446008)(3846002)(6116002)(478600001)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4728;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rP2RhoK8CdyPLZWnrmCUUdknJXYeZ8JxI+uVPjnL/9BbPW6gRhU0yW7q2VAV4AWzrM5ujyA3mKPxjHnP+HXaNLaWF5uhmfeDoHL0+Kfs8H0zZgjBVCkXTC4wCDxIZaqPd7YxP0Vb/0EEhGbGVlKWugb48coUwxKLwfuGEIEZAcieruqqBI+0KaQSUW1TCNsf0x840JE2UA2S/iXnun6Gmdov5DKPnSEG8S4iXRm4RxfdabKt/v38jdbIdjwTJT/MvNfrw7R8oxEV9djtsqz7ecId6v5gDZiqFyW7SAV8gQMZMwZpONNWMEMg1Df9okM2xAYHEtb6UggxlHojg+y8BQzNgjyG6ZQGeAq+89LN2uvEzedA8bF+m8Q/qEFpbIpoby9Y3sox9gYMJIos2HRo4d6cvv063004CVuFatDXQuZetXEDSFmX+q9lwCexDVE6
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea6f626-76af-48a5-937d-08d75b7b576e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:49:19.9685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPc2A87OAkaGZCLOOY9YC4fhe8oohf3V5qJgSLFRTl1at/61XLFVix0e9UKPjem6TLsbPx/hVFes+UvFwdoMnP9SlL6aJ8JfVMNTWBGTTAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4728
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 28 Oct 2019 07:49:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 28 Oct 2019 07:49:47 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com
	216.71.153.141 esa3.hgst.iphmx.com
	<prvs=197297270=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9S7o7UP004155
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Oct 2019 04:31:28 -0400
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Keith Busch <kbusch@kernel.org>, Dmitry,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QxCHfdzMPnGpmYhdygtA4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The reason code for REQ_OP_RESET_ALL is kept in a different function so
we can clearly differentiate between REQ_OP_RESET and REQ_OP_RESET_ALL
when we add new tracepoints with blktrace framework.

But if that is acceptable, then,

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

On 10/27/19 7:06 AM, Damien Le Moal wrote:
> There is no need for the function __blkdev_reset_all_zones() as
> REQ_OP_ZONE_RESET_ALL can be handled directly in blkdev_reset_zones()
> bio loop with an early break from the loop. This patch removes this
> function and modifies blkdev_reset_zones(), simplifying the code.
> 
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

