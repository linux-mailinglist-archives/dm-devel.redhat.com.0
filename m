Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 01352F7142
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 10:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573466325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YvSwB2TbbTxL36G477f2/IiINbYlOK9d0Psw5MlKCo8=;
	b=V7AIb1UH9+kGLJ0ykoVLC3evuQhcD3iI07MpqTTgjecjOE5/4n7i0TltUploUXpj7sCaIi
	fUSC4A5LTQpLcfk89OlV4wToTZatwF0DGX1L9GYGSpK/ziKH5FbMMkMESNGLJI1C7mKhUa
	doPjxFdJo4yM++Kw8tCKqE65NqoBeiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-lD392SbwO-2XBrh8BBL5bA-1; Mon, 11 Nov 2019 04:58:42 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 631D818B6381;
	Mon, 11 Nov 2019 09:58:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15CBE3DA3;
	Mon, 11 Nov 2019 09:58:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00D0518089C8;
	Mon, 11 Nov 2019 09:58:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8Ilo3M027023 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 13:47:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62B7D600CA; Fri,  8 Nov 2019 18:47:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D6E600C9;
	Fri,  8 Nov 2019 18:47:44 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 279D6307D913;
	Fri,  8 Nov 2019 18:47:21 +0000 (UTC)
IronPort-SDR: 86Xgug5q6WhBZF2AfFv5QkxQaOY2UFgehk7xGLHHm5aKnSmJZjMzsJAR/vBcK2suGVP183p40q
	lwlkomhBT8uV6+o3H2GSBbJuvHba1jEtY/4OIg3KdMUstCxg2Xmwg7v+sX7y1phixbghbrpc6J
	oSyPPJr/OF6TxnozDpH9AvFt28lzILQ21DtaVxwZogl5bkQ8VYQgDlhhG10PDfsgFQRJS0ojZS
	f17cpJXFDugpfl+kEmN6ayReSzBZP3uXTIAplIHOGiTx3WZFtSmrtqRNnT95FGvLoKlPoa8aWJ
	UO8=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="122523772"
Received: from mail-sn1nam01lp2056.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.56])
	by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:47:11 +0800
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
	DM6PR04MB3993.namprd04.prod.outlook.com (20.176.87.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 8 Nov 2019 18:47:11 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04]) by
	DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020;
	Fri, 8 Nov 2019 18:47:11 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 5/9] null_blk: clean up the block device operations
Thread-Index: AQHVldfcI4rsOvEhuUe6UgaOW5UvvA==
Date: Fri, 8 Nov 2019 18:47:11 +0000
Message-ID: <DM6PR04MB57549851153D90314D5C36C2867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-6-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7de547b0-f13f-45ab-ac0b-08d7647c107e
x-ms-traffictypediagnostic: DM6PR04MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB3993905385A545FEE6181A65867B0@DM6PR04MB3993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(55016002)(26005)(446003)(9686003)(102836004)(86362001)(53546011)(2906002)(3846002)(52536014)(66476007)(256004)(76116006)(5660300002)(64756008)(305945005)(91956017)(76176011)(6246003)(7736002)(99286004)(6506007)(6436002)(4744005)(2501003)(7696005)(6116002)(186003)(14454004)(110136005)(74316002)(478600001)(8936002)(66066001)(33656002)(66556008)(66946007)(66446008)(81156014)(486006)(8676002)(476003)(229853002)(316002)(81166006)(71190400001)(25786009)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB3993;
	H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxuK6StXfXwohuD++/710laaB337KuMBssYn2N4gFPhWrsyq0HKGxmKBfY3ciIpmXZrZXmmMjeaYgjGkhnV9tVZpZ7wAec36ZBU196vKOUCuPeqJw2I4koDvphm3NJM0GRyEm8sVjcXICFI3MVPOsuqSBvhDefBhF0G72syfh3pwtwhXh2DAGlUPIxExhlwY70ypBBUjJHlbB62Ay5Yw5V/1x7HBl0QOoHB/GxWumwPGegxu99yb+doMSsb8Lbd3/nwaZ5Lmc4pducMcvmBG3dY67ygJ/qDFKp+eoQPC0mR/7NRftmUd69UpW7+FimFBEYgj/0byOxWPPE75IGgiHy0PEJlNgKhOvBRfiyRwxsGDOQg1wvtT7wBUAQrhKFpXap6v8tHseFdzRhBp+HoFugYk5h+bO8x7/k84A+6BZ8hi15RvE+3PRm2cC1TZEpvF
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de547b0-f13f-45ab-ac0b-08d7647c107e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:47:11.0494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6d1PxzOIRnANSz6qs8V4Qlpj1pTIoKxYJ9WFu1VhhvIj4PKgQy3AGGv6NLJfi45TowCcFyDi524+7zwUL937boPVKQiEN8hC+urVG0x5tyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Fri, 08 Nov 2019 18:47:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 08 Nov 2019 18:47:34 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=20831143c=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA8Ilo3M027023
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 Nov 2019 04:58:01 -0500
Subject: Re: [dm-devel] [PATCH 5/9] null_blk: clean up the block device
	operations
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: lD392SbwO-2XBrh8BBL5bA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good to me.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
On 11/07/2019 05:57 PM, Damien Le Moal wrote:
> From: Christoph Hellwig<hch@lst.de>
>
> Remove the pointless stub open and release methods, give the operations
> vector a slightly less confusing name, and use normal alignment for the
> assignment operators.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>
> ---


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

