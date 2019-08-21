Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDE99109
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 12:38:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E87E30872DD;
	Thu, 22 Aug 2019 10:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C23B60610;
	Thu, 22 Aug 2019 10:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF22224F30;
	Thu, 22 Aug 2019 10:38:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LGERha016942 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 12:14:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E90B166A2; Wed, 21 Aug 2019 16:14:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FCAF6E4
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 16:14:24 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29BBC302C06D
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 16:14:17 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7LGAFow025591; Wed, 21 Aug 2019 09:14:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=sxQkFpEqNkD6VuPFB3BOEKOkoYKJvoocu/i9tUjWj1I=;
	b=IJqfMuBRYz0i7OLydSWEmcnY5uxGouZM5N2MxGDH587iAaLGfoulnvZ3/XTxE1gJiOgu
	vcPP9g+Kt+RWfmzuOHUwcbzXFRAoFLNAMvWPzcnSLFqBFuu562bNmFaTubk5VCCKQTKi
	7IeWAgWfHKIVnpSD62GYdUZ245/iAUoI4RA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 2uh31g9ksr-20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 21 Aug 2019 09:14:14 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
	ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Wed, 21 Aug 2019 09:14:13 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
	by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
	via Frontend Transport; Wed, 21 Aug 2019 09:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U/yJNb9dGLRq/Vn7jA/cEELL4EKAx5aGNu4sEWRbqS5cZSVfSG0xguUX5OwBlICCiD9YiGvEIcrs7hHHGy9BT3KNShx0gXnmuv4FyXsdQ4AeGLuM0ZqfDYoFCF+mcSemLM+0n0TQQ4pGjkwNLXIJcfA7xFCsu3jIuWIxZpTVHOyWLlNJw+gq+aWGZ8RVokiilJ8+GP2230v6GempXLDwbe5RmFHHWRbHLdBmuh50gHnoMX9fr0BYmtGpsAvL4aevZQFKfRS4/Qzw1Sp3+a6c6ljY6tpYMgihp3F2POPhZsnSliFe+qTIz0LQcBHw8aXFSm5FEg+rxE6KrDKJZpvlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sxQkFpEqNkD6VuPFB3BOEKOkoYKJvoocu/i9tUjWj1I=;
	b=iByf2BgdT5Y1Fg/mqwXQdOIzUJQOSEcQyy43+3eOlw3S89Njyb5pkkx3ENTzM/M5EAET0h0/ekdHftLuFXs9jPlntKvTkrV2rzNyeqQlxLj665P/qHc8NIKdVttJJoXY6RjtfnXDwoIPzYpM8Xe0vbUpb0+aScjN5Ul9COzR5tIEE6cc8hqxwrgANI+lXKWNU/92kY+ZzkTZhHRBfdgkOh3+CofDCfLXpTxzgC7p6//kU9RBC5sz6JIj/392uls99CAfQIfzM4bdy0lxp0KGpyo7xmVB4MsLhnKlRlY1HvXTKa6UGME/A9PXm7Oo3LJSU8aSJlSnWwxXrH8zw1ACdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sxQkFpEqNkD6VuPFB3BOEKOkoYKJvoocu/i9tUjWj1I=;
	b=ka2ySBfqX+dpwPIZTFIxN6UQ2MXQAk5VGGGL9WKYCNXDaWSmg/jJOfiil8bFnt7KiLvS2LytfT/VqE61XXl7g19tYMlOeOs+SkFpob9agN6byNGdL3Hk+nIIrq9OqWwmuUy6IeiFM1lUxWvDTYEKPNFeVDZAMa+oGthSPDq57/U=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1198.namprd15.prod.outlook.com (10.175.3.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.18; Wed, 21 Aug 2019 16:14:12 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.020;
	Wed, 21 Aug 2019 16:14:12 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v2 1/2] md raid0/linear: Introduce new array state
	'broken'
Thread-Index: AQHVVDhL8QBv9Z+6F0SUg0XP9Q0BPacCynMAgAAFiwCAAAdYgIAAA/yAgAAuVwCAAqPugIAAIOWA
Date: Wed, 21 Aug 2019 16:14:11 +0000
Message-ID: <B7287054-70AC-47A8-BA5A-4D3D7C3F689F@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
	<1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
	<4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
	<8E880472-67DA-4597-AFAD-0DAFFD223620@fb.com>
	<c35cd395-fc54-24c0-1175-d3ea0ab0413d@canonical.com>
In-Reply-To: <c35cd395-fc54-24c0-1175-d3ea0ab0413d@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::ede3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9979b89-6330-44f4-4cbc-08d726529aac
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1198; 
x-ms-traffictypediagnostic: MWHPR15MB1198:
x-microsoft-antispam-prvs: <MWHPR15MB1198786FE54B404676570B37B3AA0@MWHPR15MB1198.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(396003)(346002)(39860400002)(51914003)(199004)(189003)(486006)(33656002)(7736002)(6436002)(186003)(50226002)(86362001)(256004)(6486002)(14454004)(71200400001)(71190400001)(102836004)(6512007)(6916009)(305945005)(57306001)(54906003)(25786009)(4326008)(2906002)(53936002)(6246003)(36756003)(446003)(11346002)(478600001)(6116002)(8936002)(2616005)(476003)(46003)(66946007)(76176011)(64756008)(66446008)(66556008)(66476007)(99286004)(316002)(229853002)(81166006)(76116006)(8676002)(81156014)(53546011)(5660300002)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1198;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xecIQ3IP2fwhpdBmPeyKm1X4J8YOKtNYqxKMevbCu7coIam3azi5WUvLadxJERhwjbT8tUNdkTqQtM5LlVPG1Y1Zh/4AtC0Q0bFMQ9UOM77IulEMR9xoBfzQygvv40zpLisMADQ5+CdDxnqfLN7HeX8cKKwrmKg0n+52Pn2WZRz82oPqpkxSTVOOMQ9eHEOPd1k1+rfgrXvoe5iEi/2G1KrDDpehQ/79LCkonQv9UPVN0VAyZlYcTVWbVnwSMkV6JXs6uE33UuZCR1JLjsVnY6mf17IwFXN+75r6mWnProyHj617W13nIYUiInF+HAZww+oLGjsgSHej2UORh/eDMlN9GhfDuJmk9POMEBHZBWQ8l45wg9EgGB70I7xTawlQBqthFfMa90HbiDF/2MYv3i4b9VWllDTpJps6Vn1uxPw=
x-ms-exchange-transport-forked: True
Content-ID: <20DD6B80B861684FBAEA1CCA40A593CB@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b9979b89-6330-44f4-4cbc-08d726529aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 16:14:11.9101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQf/XsJ2/NUj2REurktt3ZhR3CX8NOz7jDrVNqPhpgns3UtZiU5VVJi1KBst8CJQLwNT1FAg3CWoZaPCHevEdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1198
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908210168
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 21 Aug 2019 16:14:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 21 Aug 2019 16:14:17 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=3136fb3c37=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7LGERha016942
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 22 Aug 2019 06:38:34 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 22 Aug 2019 10:38:56 +0000 (UTC)



> On Aug 21, 2019, at 7:16 AM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> On 19/08/2019 18:57, Song Liu wrote:
>> [...]
>> How about we test this when we do clear_bit(Faulty..)? And maybe also in 
>> add_new_disk()?
>> 
>> Thanks,
>> Song
>> 
> 
> Song, thanks for the suggestions. I've been working in the refactor, so
> far it's working fine. But I cannot re-add a member to raid0/linear
> without performing a full stop (with "mdadm --stop"), and in this case
> md_clean() will clear the flag. Restarting array this way works fine.
> 
> If I try writing 'inactive' to array_state, I cannot reinsert the member
> to the array. That said, I don't think we need to worry in clearing
> MD_BROKEN for RAID0/LINEAR, and it makes things far easier.
> Are you ok with that? I'll submit V3 after our discussion.
> 

What do you mean by "not clear MD_BROKEN"? Do you mean we need to restart
the array? 

IOW, the following won't work:

  mdadm --fail /dev/md0 /dev/sdx
  mdadm --remove /dev/md0 /dev/sdx
  mdadm --add /dev/md0 /dev/sdx
  
And we need the following instead:

  mdadm --fail /dev/md0 /dev/sdx
  mdadm --remove /dev/md0 /dev/sdx
  mdadm --stop /dev/md0 /dev/sdx
  mdadm --add /dev/md0 /dev/sdx
  mdadm --run /dev/md0 /dev/sdx

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
