Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3161917
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jul 2019 04:03:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F2613084246;
	Mon,  8 Jul 2019 02:03:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9946E1001947;
	Mon,  8 Jul 2019 02:03:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80799180085A;
	Mon,  8 Jul 2019 02:03:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68234cN012789 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 7 Jul 2019 22:03:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D5B91972B; Mon,  8 Jul 2019 02:03:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E7A19C68;
	Mon,  8 Jul 2019 02:02:59 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDD078553D;
	Mon,  8 Jul 2019 02:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562551355; x=1594087355;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=dywAFDrj0MfAgVkHqaTVZ9P6BjevwEczcnCxLBSf4Sg=;
	b=id8DMnUZuFsH15wswK4SYn62Zk+X/vVyIAxB3+90Z11Y+Kr3wK/58nTN
	zW7klb8SG275CyfT3sndsX9KlsNRLkVSH2xmqayscT2VshrkzJ9VD2OZe
	ATWNKlKrzObnF39xWnABcYHZJXr2e7JTIl4I/h2XsZvj3DqSPj+Iuxp4N
	HdNU6Czd70WQbEhQODC9l6HXZXDJ4lVe8gyFYZsfGGZn5KXsDTU44CnOC
	MvJ1bfiOckKWxyzGSmZ8zif7STyQ3hUq4HsxHmxpab8y+ciXDEtwyLpAH
	z8Rswc5UUzvgmWixgCbTWILyxDqhLkAZz48kfwWOYk6uGQdRdf9YbsoHD Q==;
IronPort-SDR: Nuwvt1vSYB9AK/4EaB3/mkm2iSck6iVQOHpsJiylSYGGHgRdPHP5Fxa0U2uM6JwiHfYX2RqS4d
	nnDW/tm6lxfDOo2cXQaD0epQwVdqoVhAQGnRuwzENrRquLXqYwb8EgVfUwN4ciwFg/QEPbaxag
	NRs43ByCufgghDlalQK7TTqVT2iDll2WEVAgLPRmB116un+dbVqzZpsp15wohvyKL5fmipJU7h
	/p61xz+iaZbEHBPQWWD0qE2m/mSYH0I+5M20M69aXQK/xU0ZPK2zhSF1edxTIOhDBb7csuTkO8
	LXA=
X-IronPort-AV: E=Sophos;i="5.63,464,1557158400"; d="scan'208";a="113580885"
Received: from mail-sn1nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.52])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2019 10:02:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dywAFDrj0MfAgVkHqaTVZ9P6BjevwEczcnCxLBSf4Sg=;
	b=ee4LqQuprJ1WGiHqfCiM/XbQeJ6M9xrEiDBXoHTs4BtNAjQlyNRDtFSkJ3tARCZBC79kIsJL2gq/TUQ1kkiYfTUB3IkzSnKFJxaORzudzWA84Ps+PYeCRJ85e3ATbtOrzqT/Yz7FnqxkdxmZkV7nydEZGIyO8MJe1DUC99u4lEg=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5864.namprd04.prod.outlook.com (20.179.59.82) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Mon, 8 Jul 2019 02:02:07 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2052.020;
	Mon, 8 Jul 2019 02:02:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH V6 0/4] Fix zone revalidation memory allocation failures
Thread-Index: AQHVL8ssJYyertgVkky0I6r2FZ0yYw==
Date: Mon, 8 Jul 2019 02:02:06 +0000
Message-ID: <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d0f2b04-9a7e-408b-18e0-08d7034847a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5864; 
x-ms-traffictypediagnostic: BYAPR04MB5864:
x-microsoft-antispam-prvs: <BYAPR04MB58643D8DB32AAB7739ED6344E7F60@BYAPR04MB5864.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(2501003)(486006)(26005)(6436002)(54906003)(53546011)(9686003)(316002)(53936002)(7416002)(476003)(446003)(55016002)(102836004)(76176011)(186003)(86362001)(6506007)(110136005)(7696005)(229853002)(8936002)(14444005)(2906002)(33656002)(81166006)(72206003)(99286004)(3846002)(81156014)(256004)(8676002)(478600001)(6246003)(66066001)(4744005)(71200400001)(7736002)(25786009)(71190400001)(4326008)(73956011)(66946007)(76116006)(91956017)(52536014)(68736007)(74316002)(6116002)(14454004)(5660300002)(66556008)(66446008)(305945005)(64756008)(66476007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5864;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XSdjz4wqQe6MIde04G1uCKnIysFNjimO+WZUG9lZ03I1rJ/w0p2lygjCoM4s73jCaKXmbNBRsIAgDRUcBx7NqvSreO5D3xjEqm/UnyAVj7qhv1fnyDKkYLU1egwO+WWy/8TrPuK2VaptGKvc7dWdbQB7S5UBKYfA1bkySRe5TFTvVH3b7fqvkSs4l2YEITS7DbKdyMHa9AIBq9Ot+TnTLAIl+7uz8DArxvTnuF7vDuoCFHbpak5YRBh0HvCtFz5rHoi3OzsqUZhoGO+MQh3dlAZWvKVTuG70PZgE3kKCGfhIvVgsmf0OwFQjMwjDgEUiARuU+kpeJdcf/XT8cVcTcUfXsaaiLymGoJzcP2W2r00IWSKuuECUc5ebXtVuwkoMISfQE6QbxYSTY6izR5fOfVMLy6ooHwCH4IND8JJdm64=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0f2b04-9a7e-408b-18e0-08d7034847a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 02:02:06.8556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5864
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Mon, 08 Jul 2019 02:02:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 08 Jul 2019 02:02:35 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=085e64fe2=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x68234cN012789
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 0/4] Fix zone revalidation memory
	allocation failures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 08 Jul 2019 02:03:41 +0000 (UTC)

On 2019/07/01 14:09, Damien Le Moal wrote:
> This series addresses a recuring problem with zone revalidation
> failures observed during extensive testing with memory constrained
> system and device hot-plugging.

Jens, Martin,

Any comment regarding this series ?

Best regards.

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
