Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8A95A10
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 10:44:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C6D7811DC;
	Tue, 20 Aug 2019 08:44:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F1305D9CD;
	Tue, 20 Aug 2019 08:44:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 022FA180BA99;
	Tue, 20 Aug 2019 08:44:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JIvG8n022710 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 14:57:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4364BBA7D; Mon, 19 Aug 2019 18:57:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 378EF18119
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 18:57:10 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03F393175285
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 18:57:10 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7JIgviV020701; Mon, 19 Aug 2019 11:57:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=HemAzY1xqV3LbQHU39NMEHvxOrQpU3qZPtC7PFBUnIg=;
	b=roUApnaFvJ0p6ac7HDMwTk8x3QK70jsM7Esign/PvjlBo93u3jPqMGVk/9xpn7NF02Do
	DH9rwiG2xADW6J+g8/wRRxYBXS5nXVUkZK+6+/EQh+ehNvMFqHuZGDnr8HwCupX38oVY
	3ZKT9KZZpY1xOAGfBVV8Pg+tTm76z6D29zk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by mx0a-00082601.pphosted.com with ESMTP id 2ufxcp0wp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2019 11:57:07 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
	prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 19 Aug 2019 11:57:06 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
	prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 19 Aug 2019 11:57:06 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Mon, 19 Aug 2019 11:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Ws1D4v9ObgXFLYmL6PcMgNdi+BZ6rgzvs2D6MVn3L6VXE6FrnwhnxKVShJh/uGYynbOYT1RcbBcuc28nONc9Vw8mg+W60drQPPHNJ2m9YQg1KlH479pV536mqd6+AoPUX7WrD+LOzn3Np0hUHj3nZXf3DBVilwN2TdGLp57p111/pJTsQ+6ae2r8tVXF4D/jZ3JRxaLqNCTR8d3DoBsTLcS5d1f5h2+LQRcSYE0tK9l/Mx16v56NDrHNRIkzVR6wIzbqi+uTvGz14hxxHy4A1AxEJQo//Vknv4CGC+cQPR1fKsydBFpOZKrA5Qcb6Mcn4nlGy9Xwd/9rE7wPc6eDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HemAzY1xqV3LbQHU39NMEHvxOrQpU3qZPtC7PFBUnIg=;
	b=DOA53sOT1sspT2JdaaFpT3i9r4oYoFU/fVO5txM6GOmwUD9mpv2HFRk8+XfOM7X3Z6ofd2AseGZLYAmdKgtK49+fk2SjVYrgDvK3zAONb1YaQCDqrfqafuwjeXH+iwhqqlqQ4gAB4CoKbElnTmo2EGHsjU3Ho4S4tOlANsxl/m3XvOqeMbI84XtOovCfAYmmFaO5exQebJIlLmJln7gWG2Hz3e+OlrUvRbbsJHP0diM/8g7Uo7XHwPPXiJ7jCt506Cqza7UzmfamFu0hnaFWB8sNpF9miIHS7E4PwFlnqiTLXfZAVttQsc97LOOXn12ZrSWuWmd0N7Lm6mROReuOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HemAzY1xqV3LbQHU39NMEHvxOrQpU3qZPtC7PFBUnIg=;
	b=HZOfpqpEzekHVvTyx4uXV0EEeX+InfwBwsh3iLOmPPuG90CAr1GSLCEN1tzn+ufv2rQgCnMMDZW6KTaFQz1pGYKH8QSddYec0umD6corv+7EXRfyT3dU/p3mO/QvgiryFyv9eN+LoWsrmGM74dqTVwc8e2JVpl89Fk7pc89oct0=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1616.namprd15.prod.outlook.com (10.175.142.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Mon, 19 Aug 2019 18:57:05 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.018;
	Mon, 19 Aug 2019 18:57:04 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v2 1/2] md raid0/linear: Introduce new array state
	'broken'
Thread-Index: AQHVVDhL8QBv9Z+6F0SUg0XP9Q0BPacCynMAgAAFiwCAAAdYgA==
Date: Mon, 19 Aug 2019 18:57:04 +0000
Message-ID: <1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
In-Reply-To: <1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:a981]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28c7ad66-b0b9-4019-ff2f-08d724d706f6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1616; 
x-ms-traffictypediagnostic: MWHPR15MB1616:
x-microsoft-antispam-prvs: <MWHPR15MB16160A09E6F0E0E52CC52341B3A80@MWHPR15MB1616.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(316002)(50226002)(99286004)(6486002)(478600001)(2906002)(71200400001)(86362001)(14454004)(71190400001)(54906003)(76176011)(229853002)(4744005)(8936002)(6436002)(76116006)(6916009)(66946007)(305945005)(81156014)(8676002)(66446008)(64756008)(81166006)(66556008)(66476007)(33656002)(6116002)(5660300002)(7736002)(186003)(57306001)(36756003)(102836004)(446003)(6246003)(46003)(6512007)(11346002)(53936002)(486006)(6506007)(2616005)(476003)(256004)(53546011)(25786009)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1616;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3cEvZHwSWK/qSUbeEIy2jiYl23YVwb77d02ZjD1GvFLHy37qqQqSopJzraVTakPluJbeHQBQjVPNPzD432nio+TmxRWgtzumW8s57Vg0HJX809nHLg8LmyY960tGglkikgH5vBONqIw2Zt/rbrGVhHV26O2ZljchDG9d15OzAUhgXMgC55K9f41MZV8qDwfU7BPe5zpEn/t8Z0LQeDTIc9qLkLP8daejJ3ARN/V3vMda9N+C8kRdewgY+tkGaN38iG9tqO2YLRZmTK2Bykk7a5P+no1wJlmOlW3uKFR3xXGuHo7GVIucHFR3xbOmgZpl7cNhTE6Spbp/fyLNuXQ21Zh+ye/VM2FGpfTeRYCV8Z+aOTQA44QEFkVupV/HD61l6LzeGC1DSb/s6a6YOZDfmBypGK7PYd2StnF1fI3EZZs=
x-ms-exchange-transport-forked: True
Content-ID: <551F59B2A4275A44AFBDA837E62AB277@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c7ad66-b0b9-4019-ff2f-08d724d706f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 18:57:04.7074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqd4WNwnQSwL2GqDaSwAhON+78Bb3+An3n5qhD8eQA5S4Uo1lcB5A1M9rQV00zysNqwoRjfDE6K6xrWf0w/Dpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1616
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908190193
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 19 Aug 2019 18:57:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 19 Aug 2019 18:57:10 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=313431625a=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7JIvG8n022710
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 20 Aug 2019 08:44:13 +0000 (UTC)



> On Aug 19, 2019, at 11:30 AM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> On 19/08/2019 15:10, Song Liu wrote:
>> [...]
>> 
>> If we merge this with the MD_BROKEN patch, would the code look simpler?
>> 
>> Thanks,
>> Song
>> 
> 
> Hi Song, I don't believe it changes the complexity/"appearance" of the
> code. Both patches are "relatives" in the ideas' realm, but their code
> is different in nature. My goal in splitting them was to make more
> bisect-able changes.
> 
> But feel free to merge them in a single patch or let me know if you
> prefer that way and I can do it.
> 
> There's also a chance I haven't understood your statement/question
> correctly heh - if that's the case, please clarify me!

I was thinking, if we can set MD_BROKEN when the device fails, we can 
just test MD_BROKEN in array_state_show() (instead of iterating through 
all devices). 

Would this work?

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
