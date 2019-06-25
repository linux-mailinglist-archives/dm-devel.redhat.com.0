Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF458D10
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 23:31:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B2A530C1CBE;
	Thu, 27 Jun 2019 21:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DA1560126;
	Thu, 27 Jun 2019 21:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4A034E9E2;
	Thu, 27 Jun 2019 21:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PGqnMF013847 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 12:52:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E09E19728; Tue, 25 Jun 2019 16:52:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3CB19936;
	Tue, 25 Jun 2019 16:52:44 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99D80CA1DF;
	Tue, 25 Jun 2019 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561481554; x=1593017554;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=mAEKh2f2qxE37FX9Gt8rNXvP4TmZRL0/AtUPeup3d/I=;
	b=eKJKUzeSgf3OIMCc/bJxP1hciT1Iz9gWZr45wJijNNhJ9gDlhgyWVOyU
	yB/vsz1XvZLM6a5veqreGlKiNxSvDR4kmTgEof+jCHi4EoUQDupmL5wkU
	6/BBW6+PQBg29pk8Jjd5L8A5zDp5/vtasMNO4uO0lNsl8Kp7g7SLTVhQ8
	CEJfn76DxOxmBnISdiggUvFv1KGPXNtDXmDihRGizwqCgF0gwn9ikx8JG
	PnH8Jhkc592fxSpaLOs3kD7jusqta9YvgXW4EaoK4Bbrdf4Gwd625hgdR
	LTTdFrCppOBfNeqh1/Tw6763WwIrMShpa2TbX4aRjS5wG/1L1rQyWOtJH g==;
X-IronPort-AV: E=Sophos;i="5.63,416,1557158400"; d="scan'208";a="211303532"
Received: from mail-by2nam01lp2054.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.54])
	by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2019 00:51:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iWJyh29B5Jw5+cX9ZFoS66XzsPnPmF5Wu4e4Vv9kLVM=;
	b=jd5PVhwqdu0rsrw4PWxZNXN0/cBeqsLP722av0jhE37rx96dA6sc1xphU41V8VaU0jLA1jurt4b1MjHWpHTxQ9RVEcrJIltHZfS0YvmnZj22KPcpGZ13oiWkn4r6CGWNNAp93i5tUQ8F/bK8ZaTp6eITtbL/+qY3TRGbNd2aG/A=
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.58.26) by
	BYAPR04MB3845.namprd04.prod.outlook.com (52.135.214.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Tue, 25 Jun 2019 16:51:51 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::fc2b:fcd4:7782:53d6]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::fc2b:fcd4:7782:53d6%7]) with mapi id 15.20.2008.014;
	Tue, 25 Jun 2019 16:51:51 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, =?iso-8859-1?Q?Matias_Bj=F8rling?=
	<mb@lightnvm.io>, "axboe@fb.com" <axboe@fb.com>, "hch@lst.de" <hch@lst.de>,
	Damien Le Moal <Damien.LeMoal@wdc.com>, Dmitry Fomichev
	<Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh
	<Aravind.Ramesh@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] block: add zone open, close and finish support
Thread-Index: AQHVKDJQD2Z4QYw9b06emkXLk9EL8A==
Date: Tue, 25 Jun 2019 16:51:50 +0000
Message-ID: <BYAPR04MB5749977B2FFB5CDC8A254F5A86E30@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
	<79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.45.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f10a9017-9136-4c32-a138-08d6f98d6b98
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB3845; 
x-ms-traffictypediagnostic: BYAPR04MB3845:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3845EBE429AAED055E5376F986E30@BYAPR04MB3845.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(136003)(366004)(376002)(396003)(199004)(189003)(52536014)(66066001)(2906002)(26005)(99286004)(86362001)(72206003)(8676002)(14454004)(81166006)(81156014)(53936002)(2201001)(6246003)(6506007)(3846002)(68736007)(74316002)(53546011)(229853002)(6436002)(102836004)(9686003)(7416002)(71200400001)(71190400001)(7696005)(76176011)(305945005)(7736002)(186003)(33656002)(66574012)(2501003)(14444005)(316002)(54906003)(6116002)(5660300002)(55016002)(8936002)(76116006)(478600001)(25786009)(256004)(66476007)(73956011)(486006)(446003)(4326008)(64756008)(476003)(66446008)(66946007)(66556008)(110136005)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3845;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R0mk295SwJYhzDNQrxGPzdvnic4BYrLHH1x3sBmKIM+OHVLkO9Uc/2nB2ISOyjMI0juGM3gu3Y2J/A/RDLQqRsutRzjYcdJCSHo4shfyvLQExub1hOnWqCG4WYZxlC9iSx/ZgZ/m2bYggpiMer/trE1E0rxxuCnwvw6QBWk44p5ztgm1nNRaLtpK+vtLk+gaaor62YJ2C1dbVYcPAZvwalYX1xmhTjYTOr1vDCpCasiMCMV2CcaKR3T6bqMrsgRJ+Id1sx0PWdNjSYu63zKijkwnWlcy6VA24o569BBzMCkfgyQSJQOHcXF3LAg7sW7AT137mIfhH+EnXZ+gtvoQ3C77zNFT9tvnPvN9Qz1xmEEovdiZiIuEgzmoG1BDrPGeg4P1Mby/Jxg+JFjnq3QwoDYordxFBLZGeXfFnlVMDVw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10a9017-9136-4c32-a138-08d6f98d6b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 16:51:50.9344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chaitanya.Kulkarni@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3845
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 25 Jun 2019 16:52:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 25 Jun 2019 16:52:33 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com
	68.232.143.124 esa2.hgst.iphmx.com
	<prvs=0728ab7aa=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5PGqnMF013847
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Jun 2019 17:29:46 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 21:31:36 +0000 (UTC)

On 06/25/2019 08:56 AM, Bart Van Assche wrote:
> On 6/25/19 3:35 AM, Matias Bj=F8rling wrote:
>> On 6/25/19 12:27 AM, Chaitanya Kulkarni wrote:
>>> On 6/24/19 12:43 PM, Bart Van Assche wrote:
>>>> static inline bool op_is_write(unsigned int op)
>>>> {
>>>>      return (op & 1);
>>>> }
>>>>
>>>
>>
>> The zone mgmt commands are neither write nor reads commands. I guess,
>> one could characterize them as write commands, but they don't write any
>> data, they update a state of a zone on a drive. One should keep it as
>> is? and make sure the zone mgmt commands don't get categorized as either
>> read/write.
>
> Since the open, close and finish operations support modifying zone data
> I propose to characterize these as write commands. How about the
> following additional changes:
> - Make bio_check_ro() refuse open/close/flush/reset zone operations for
                                          ^
Since finish also listed above which supports modifying data do we need =

to add finish here with flush in above line ?

> read-only partitions (see also commit a32e236eb93e ("Partially revert
> "block: fail op_is_write() requests to read-only partitions"") # v4.18).
> - In submit_bio(), change op_is_write(bio_op(bio)) ? "WRITE" : "READ"
> into something that uses blk_op_str().
Good idea, I've a patch for blk_op_str() and debugfs just waiting for =

this to merge. Does it make sense to add that patch in this series ?
> - Add open/close/flush zone support be added in blk_partition_remap().
same here for finish ?
>
> Thanks,
>
> Bart.
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
