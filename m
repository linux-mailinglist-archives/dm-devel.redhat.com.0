Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF895A09
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 10:44:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A5068980F8;
	Tue, 20 Aug 2019 08:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 555101001947;
	Tue, 20 Aug 2019 08:44:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E161724F32;
	Tue, 20 Aug 2019 08:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JLvIT0027891 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 17:57:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CECF5C21A; Mon, 19 Aug 2019 21:57:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 967525C298
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 21:57:16 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F54C883BA
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 21:57:15 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x7JLuZhi013569;
	Mon, 19 Aug 2019 14:57:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=pgVev8umeU0h+Qmn+vGss9mRkxkuDIAmroDRG5TIaTU=;
	b=ON8JRhCA6xi4yDptR/U+5arCVuRd6z+1HeBjFkz4rG3gdyoYLz36NPoB8h1PTGrQXxxc
	QYM5BNeG7cjDx+tgJz6nab4FigUt5hVIPX96HRk38XtbEZUNsYQeSjkfcfl4sBJrLY8A
	j6zeFkouzQ8lM59zvFoYn/ixUo0G0Fuae9E= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by m0089730.ppops.net with ESMTP id 2ufypy98sx-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2019 14:57:13 -0700
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
	prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 19 Aug 2019 14:57:12 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
	prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 19 Aug 2019 14:57:12 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Mon, 19 Aug 2019 14:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RNnozbZcdbbeaGg4Bh3IER9EanEoRF03IwJFc7WS3ojaApA8zPBaxpQRhJ26y19fYMvYKSW6Jw78Er1jXxLFQAPIBBcze3rIMGwRdFbDm6VI2SzTGGPSICfXMW3qDIE/TezQHmOIbVQSLmKqR1LuxPQyYOia/pQn8+KjHQNa7FFuHzwr3iuQIw89gydG642qIziZfWrAaVHJAbJai8wQJK3cZN89mF26anJpm+eEQSeqBe6ZQcKMV6AL8WiNh2hGVT7CVdxJPmRCYZ5kA4W/SazPjTEvI6gn6WjbRyI7PlkZTlt7cK2kHicpBuFXl520S0Ut0+7ZXoTpDjLGgmvBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pgVev8umeU0h+Qmn+vGss9mRkxkuDIAmroDRG5TIaTU=;
	b=bvbn8zyh97bahwChDFTKVSR6EF2yKAMlGFab6+Kl7816AMn4tQrNP/ql7youhpxUDAE8KmlG7Ry7PSz1QTDZfuMvsciBBPhBlVNPyEPwAGiXxdRRpc3kkd9/aV0tZYM9WIfO5YhRZSLSKKmsNL6OS7ICUsF+Y+lnqDkAr3Z3wlfK4/3imbGcOIZC88X+GEU3008JMsvuu2xNDEPe2PhvV21P45G/sqjMZ3FD0Ophw4xjeZElb8wd1hNLWiUBm8NmhnpcICs4N+X+8Q4r1St08HFQJ2filUJ6wnvsaaIAybFX/c+QApZcS9o94k4tqjF0Htsi1LSYBcMSnncwbcnzow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pgVev8umeU0h+Qmn+vGss9mRkxkuDIAmroDRG5TIaTU=;
	b=WXTxWcWMMnh+EtgcSBjGSDe7/wKNUpznP/EPoiqWXL2dRGi9F1FJ4iey/ZkmwenwQaWpAU/uj69Bpn8DBnknPYwvU0UOsk3RjHrXjX9nfvNlDUEax2w65tQhCbnoF/BvS/4j9Gsrap8RqYlV4WsB1DwXGtZnY62C7PlPD/Xprbo=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1662.namprd15.prod.outlook.com (10.175.140.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Mon, 19 Aug 2019 21:57:11 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.018;
	Mon, 19 Aug 2019 21:57:11 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v2 1/2] md raid0/linear: Introduce new array state
	'broken'
Thread-Index: AQHVVDhL8QBv9Z+6F0SUg0XP9Q0BPacCynMAgAAFiwCAAAdYgIAAA/yAgAAuVwA=
Date: Mon, 19 Aug 2019 21:57:11 +0000
Message-ID: <8E880472-67DA-4597-AFAD-0DAFFD223620@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
	<1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
	<4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
In-Reply-To: <4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:a981]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb3f6859-aec7-4d2d-3df7-08d724f02ff4
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1662; 
x-ms-traffictypediagnostic: MWHPR15MB1662:
x-microsoft-antispam-prvs: <MWHPR15MB1662D95CD665B5BC2FBFD99CB3A80@MWHPR15MB1662.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(136003)(39860400002)(366004)(376002)(189003)(199004)(66946007)(54906003)(66476007)(66556008)(6486002)(316002)(4744005)(5660300002)(66446008)(6116002)(6436002)(57306001)(8676002)(53936002)(8936002)(64756008)(2906002)(86362001)(50226002)(11346002)(46003)(446003)(2616005)(476003)(6916009)(6246003)(76116006)(256004)(6512007)(102836004)(305945005)(4326008)(478600001)(6506007)(53546011)(14444005)(486006)(71200400001)(99286004)(71190400001)(229853002)(14454004)(25786009)(81156014)(81166006)(7736002)(76176011)(186003)(33656002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1662;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mtF1nF8M6yoJ5PWwWfTKU23lP2QRv5DCzEziICdqVANXnbL2jeiGC+2I7F8I1ZpMqlbH1dFUhLkfo3m87YyqkHbzfOdO/OudB+l+vo6xzlpoFtrcJFdZemoOiefJTr+C87fnfzZZNBK0eOIuX1Sb2Db5ZpbtUNx1bF6WV8yhjlomF+uL4ouxiWYDNk4R2ZbiaGEVfC+9jrpAC5XCwGic++trHWtRlC1F/EFdNGXE3K7GeBCe4Iba5LjY9f2rocwr3WZLivGDl9HLaHFJDoJ1Hoc9exP9PobFdIvtFN/LlYWyd3mc202VdyjMp4XIDPG7h0ZUdBC39Hk6DcRF/xYd6Jg6aPKpg/CmpsxmvkkeosWAAL5yjJtVbDcTbC3JK95qsV3HPejkZbgC7pb/5Ky9h7lAEvn7fqsEdqs/VjcXnqg=
x-ms-exchange-transport-forked: True
Content-ID: <701F7D3BDA043B4FB7ECA9A65B7F182C@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3f6859-aec7-4d2d-3df7-08d724f02ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 21:57:11.0616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhobteCgl1tTdt90fvqandWWddafnFzTKNUqfXop3psP91tTSwzgmVpzlPy2U/XYTXmfqagBlPwbpuh5mAO2ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1662
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908190218
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Mon, 19 Aug 2019 21:57:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 19 Aug 2019 21:57:15 +0000 (UTC) for IP:'67.231.153.30'
	DOMAIN:'mx0b-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.153.30 mx0b-00082601.pphosted.com 67.231.153.30
	mx0b-00082601.pphosted.com
	<prvs=313431625a=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7JLvIT0027891
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Aug 2019 04:43:46 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
 state 'broken'
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Tue, 20 Aug 2019 08:44:08 +0000 (UTC)



> On Aug 19, 2019, at 12:11 PM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> On 19/08/2019 15:57, Song Liu wrote:
>> [...] 
>> 
>> I was thinking, if we can set MD_BROKEN when the device fails, we can 
>> just test MD_BROKEN in array_state_show() (instead of iterating through 
>> all devices). 
>> 
>> Would this work?
>> 
>> Thanks,
>> Song
>> 
> 
> This could work, but will require some refactors; it'll simplify the
> check for a healthy array (no need for is_missing_dev() function) but
> will complicate the criteria to clear MD_BROKEN and the detection of
> more members failing (we would stop the detection after the 1st failure
> if we only test MD_BROKEN).
> 
> We will always need to test the GENHD_FL_UP in some code path, to be
> able to show users device recovered from a failure.
> Where do you suggest to test this flag?

How about we test this when we do clear_bit(Faulty..)? And maybe also in 
add_new_disk()?

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
