Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0641CF7143
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 10:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573466325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g1okzkpw04tf5LLyv0uajjVy3bT+4tkPR1UFswKhni8=;
	b=IkFNnRU3AYHm5xEGbrQP67x8jIbKEn7e8yHUIii7DIeKbvCxNHiUcGrFCnC4uiApuhViLx
	9Xg05sc97b+4yXiARr0JqA87hkbn+5WVFziX1evbFgwABdtCwZJseNWi2F1YaFIu2B+y24
	GnIXUh6NshBi50gonx8cAjxlkLPgWyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-gss1V6XXOlSNXxVQqX60ng-1; Mon, 11 Nov 2019 04:58:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966DF18B6383;
	Mon, 11 Nov 2019 09:58:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B8569F41;
	Mon, 11 Nov 2019 09:58:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 008614BB65;
	Mon, 11 Nov 2019 09:58:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8Im1IR027041 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 13:48:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B6D1600F0; Fri,  8 Nov 2019 18:48:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4171C600CA;
	Fri,  8 Nov 2019 18:48:01 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0567C3083387;
	Fri,  8 Nov 2019 18:47:40 +0000 (UTC)
IronPort-SDR: disVkONpimVkV+5nONEZ9mGi6c5MwklkDmknR1enp39E7OUqsW5qAwFf49N5CjQRrAMaWgvy7P
	mZnGbpfL6LGq06q3yPZruU0PeKhP1KU5eqtWckeiMjpQdr0DcFPXXiPbwHNJIkeF86QtJ7FPnW
	cd9/4Ol6aZjWg+aNmC6+Bc81M/8gCwpd1k4HDQO2VrUe07cv71e0NFrif7e2pNgN0D0JJ2KXXt
	KO5fOJw3dQaMZt9xgLWFLnchFe5wRRryHxlAeh6O/WHL97o7/5vyTYP8kQTsMIwnZyEuEmp9qT
	4y0=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="122523783"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
	by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:47:30 +0800
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
	DM6PR04MB3993.namprd04.prod.outlook.com (20.176.87.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 8 Nov 2019 18:47:30 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04]) by
	DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020;
	Fri, 8 Nov 2019 18:47:30 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] null_blk: clean up report zones
Thread-Index: AQHVldfde8HAJMYLm0eJIjLXj3HMAw==
Date: Fri, 8 Nov 2019 18:47:30 +0000
Message-ID: <DM6PR04MB5754D9A214040C012CF475E3867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-7-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 886f1a27-a8b5-4e62-ec1e-08d7647c1bdd
x-ms-traffictypediagnostic: DM6PR04MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB39932F80520D57A09F1F0D07867B0@DM6PR04MB3993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(55016002)(26005)(446003)(9686003)(102836004)(86362001)(53546011)(2906002)(3846002)(52536014)(66476007)(256004)(76116006)(5660300002)(64756008)(305945005)(91956017)(76176011)(6246003)(7736002)(99286004)(6506007)(6436002)(4744005)(2501003)(7696005)(6116002)(186003)(14454004)(110136005)(74316002)(478600001)(8936002)(66066001)(33656002)(66556008)(66946007)(66446008)(81156014)(486006)(8676002)(476003)(229853002)(316002)(81166006)(71190400001)(25786009)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB3993;
	H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhMlDObvQsTnMApHfvrnflInXhg2RBqj35e5KCmV2MQfavQOcVJSprNcH+Q/ivZpc30S0HiLKpveqLwZDwWn8G7/qT5z8kjbrSAQz/ubMCF8NU4Fe6PHPmsur4+RiY9OLwsBxuwb1kLHatk3vmXFFiMAzftGpSsbWdCkZiJnRlIDiO7xO+Ex6k+pHpUtJHnQkX3NpCLNAOrmGmgnNBXXDpRNXVMxM4QyDq+Tfu1e0Ir6gT+rqyuUuC4UUR2MWcSRRU5YP2i61O45xI+k5yVa974OnbjbJm6RYcFLZTegkdsd7AdbfcOi7Ugg0zw3BGpTfXazGG6BlvCEVp0CdIU1KhajH0RNoDeoJzeCB/3uTgMnyFzPyviZUShIXM07xRb8GVY6ezf5y7GGXizsJ9nWfYv00lUxOTk5u97IKwWZITpT3QBOUME13WTgdV7M+ifO
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886f1a27-a8b5-4e62-ec1e-08d7647c1bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:47:30.1336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zR07IsicZaVwQGBgTwEg8+jr7oSUgMJ/++3rzMDgs6tH7RVP4OXuo5cxrTaIneWP/U4uAfHHAqsY7xMgRM8q8I2zAXCneAVsiPTxWZjd9/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Fri, 08 Nov 2019 18:47:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 08 Nov 2019 18:47:53 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=20831143c=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA8Im1IR027041
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 Nov 2019 04:58:01 -0500
Subject: Re: [dm-devel] [PATCH 6/9] null_blk: clean up report zones
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
X-MC-Unique: gss1V6XXOlSNXxVQqX60ng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good to me.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
On 11/07/2019 05:57 PM, Damien Le Moal wrote:
> From: Christoph Hellwig<hch@lst.de>
>
> Make the instance name match the method name and define the name to NULL
> instead of providing an inline stub, which is rather pointless for a
> method call.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

