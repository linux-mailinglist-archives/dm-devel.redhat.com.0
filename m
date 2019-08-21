Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A49910A
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 12:38:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E6C67FDF4;
	Thu, 22 Aug 2019 10:38:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2276160605;
	Thu, 22 Aug 2019 10:38:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF73624F30;
	Thu, 22 Aug 2019 10:38:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LI6L6M022639 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 14:06:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76C0D7E43; Wed, 21 Aug 2019 18:06:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6BD58BA
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 18:06:19 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F073CA2E0F0
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 18:06:17 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7LI054t011307; Wed, 21 Aug 2019 11:06:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=/6Jhs2V4y6x34i+nTYIAAlAySGgdF5/DSgCmou6oz3Y=;
	b=MLGxSz/BmkQascYvdZjoGr2jvbmSwGmZjPNCXDukJtXnrStp89X8KLUA4GF3hWVAEteE
	g7xsdK1F3jg+EeXHrjcaSssSk1SB3c6yWcNRfYK1RWP0SL3SbXsi8Cb2yG3AQ3JxocUn
	zGLC9zRXPO+CLJX30rkrghCnBMXtMQWAgcA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 2uhadxg5cr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 21 Aug 2019 11:06:14 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
	ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Wed, 21 Aug 2019 11:06:11 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
	by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
	via Frontend Transport; Wed, 21 Aug 2019 11:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TmIdUK29M715o2Z6uQ0A2Ku3UKw98KYkgC7RW6jhrUnf2CqHcypG22N3s7WqEzg/nClTQTevj9z5GEi9rtGQByawxbI2Wj0G3Vw2kyBiJbZbfQD+2byRLlMcrY/XkOIDRm9rPSZ8Ut8Y+Tykf805bVFjtqWtrGt3ZmkjlXcpjxVNRPSg2EuSdf4gMwwnNFVTgU91JXa8a9hlAEqeA73dqdMuNEoin/24Hpol6LO0W1PgJ4SvFIH8Xa/0BWrc1nmCiHXrnwx4HnbFVjDzvpwpgTnC7sgQ/sXkPejleEy99OrD/1dOlQvM8BvyKWstoEX57k0iog1PXrOfKgsNODKZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/6Jhs2V4y6x34i+nTYIAAlAySGgdF5/DSgCmou6oz3Y=;
	b=VT0FsWFINk0JBJGV4ilfVS6vsgR1sWa4kJSgniGgsEwixbM3ucdl6TzFki94/8y8fkijySeWdSWy75A/wLY1j9qLQmODP9fuyCH92W1G/GEcDDpzingn3yw0QZX0wA7FU0KbEMVzS45wkl0gICD5pnxmbLipEOGqydMEpHG5bd6d2/JcN071xLLLDdA6yE6WVL+1tkYMz6peXsjjsXdpAOIRBOcXFnEWMkBJWGL6kB2wIDeEzY7tda/UahFQ8b0uxty1E0QkvV/Jcog5NJn6B8IKtiZ9YV5G9OT7n+mx9gpDA0jgNdI+rR318HVkFBpCM7lEJsDEXzdJWWVY4MSxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/6Jhs2V4y6x34i+nTYIAAlAySGgdF5/DSgCmou6oz3Y=;
	b=fznAWMDC4vz1KWg4wjkzfOCnvZB/6QG367XuiSm4wtjmu+gQFEJIsvnlWtd4FPal4zQ7NTn8332ibA5yHtyai2iy5wSCk+3MtoJAHAVEvGnowZnaPW/6RiAVT+oHEgeBOCDV4c7yLXlaG1c131KQyoRDT4ss9ERbxyCZh00dEFA=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1726.namprd15.prod.outlook.com (10.174.254.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.18; Wed, 21 Aug 2019 18:06:10 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.020;
	Wed, 21 Aug 2019 18:06:10 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v2 1/2] md raid0/linear: Introduce new array state
	'broken'
Thread-Index: AQHVVDhL8QBv9Z+6F0SUg0XP9Q0BPacCynMAgAAFiwCAAAdYgIAAA/yAgAAuVwCAAqPugIAAIOWAgAAfS4A=
Date: Wed, 21 Aug 2019 18:06:10 +0000
Message-ID: <F0E83794-C5CA-4E4D-A649-21DC9E2957B8@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
	<1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
	<4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
	<8E880472-67DA-4597-AFAD-0DAFFD223620@fb.com>
	<c35cd395-fc54-24c0-1175-d3ea0ab0413d@canonical.com>
	<B7287054-70AC-47A8-BA5A-4D3D7C3F689F@fb.com>
In-Reply-To: <B7287054-70AC-47A8-BA5A-4D3D7C3F689F@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::ede3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65020849-5e16-48ef-3bce-08d726623f0d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1726; 
x-ms-traffictypediagnostic: MWHPR15MB1726:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB17261CD6642A63B5D2232C29B3AA0@MWHPR15MB1726.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(376002)(136003)(51914003)(189003)(199004)(14454004)(11346002)(446003)(486006)(476003)(2616005)(46003)(7736002)(71200400001)(71190400001)(186003)(86362001)(57306001)(305945005)(33656002)(5660300002)(6506007)(53546011)(102836004)(76116006)(6246003)(6486002)(36756003)(66946007)(6436002)(229853002)(76176011)(478600001)(99286004)(6916009)(966005)(2906002)(54906003)(8936002)(8676002)(4326008)(53936002)(6116002)(25786009)(81156014)(81166006)(66476007)(66556008)(66446008)(256004)(6512007)(316002)(50226002)(91956017)(6306002)(64756008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1726;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BpGOrNrGt9FZscUTinWNnu9pLgrBqHqsrllZj5jMe7J529UXVCB+pFyNPeqi9YTcAcDNjD/YPXn9YFbhgSQVdUPhI7XT5UHalzaI4FjK7cyEXtyzCXIeuL5XFOgpQqYVChm0MF7XfUcJMMUGOZ6TppcEq27pRH5vuHagi+NMYbRoIQTNo2PQp+4rIw7DfeIiyJGtQNNNeI/WQUJ4L4Rwdlqt6+tGLd19IGQRaZkdidsY1U54q9OalfeR0H316mB5Ko16BE/5tOBGFJYjE1qMTGgaN1KPWKqCSLB5JbveXUzmsLKFt1ut5pgzHIzI+tIkqxWi5dCksMGUmg6CqMJIhPT+RhCkADywXIPJTeho2HXVdagyzqBVBIRv880i/wP3oy8KvMJC/sWf++PnavSb/znFWxwSTUXD673XNiL9RNk=
x-ms-exchange-transport-forked: True
Content-ID: <FE8D60056E4BE34890A497A6C8603777@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65020849-5e16-48ef-3bce-08d726623f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 18:06:10.0777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rs686i7k3bwLwCZXep5Hes260DYeHplXcEgMa3kze+HnzLUVloO+mrV+WTcORd/mCk9cDpwhtCuODZZsbXZMRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1726
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908210180
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Wed, 21 Aug 2019 18:06:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Wed, 21 Aug 2019 18:06:18 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=3136fb3c37=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7LI6L6M022639
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 22 Aug 2019 10:38:57 +0000 (UTC)



> On Aug 21, 2019, at 9:14 AM, Song Liu <songliubraving@fb.com> wrote:
> 
> 
> 
>> On Aug 21, 2019, at 7:16 AM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
>> 
>> On 19/08/2019 18:57, Song Liu wrote:
>>> [...]
>>> How about we test this when we do clear_bit(Faulty..)? And maybe also in 
>>> add_new_disk()?
>>> 
>>> Thanks,
>>> Song
>>> 
>> 
>> Song, thanks for the suggestions. I've been working in the refactor, so
>> far it's working fine. But I cannot re-add a member to raid0/linear
>> without performing a full stop (with "mdadm --stop"), and in this case
>> md_clean() will clear the flag. Restarting array this way works fine.
>> 
>> If I try writing 'inactive' to array_state, I cannot reinsert the member
>> to the array. That said, I don't think we need to worry in clearing
>> MD_BROKEN for RAID0/LINEAR, and it makes things far easier.
>> Are you ok with that? I'll submit V3 after our discussion.
>> 
> 
> What do you mean by "not clear MD_BROKEN"? Do you mean we need to restart
> the array? 
> 
> IOW, the following won't work:
> 
>  mdadm --fail /dev/md0 /dev/sdx
>  mdadm --remove /dev/md0 /dev/sdx
>  mdadm --add /dev/md0 /dev/sdx
> 
> And we need the following instead:
> 
>  mdadm --fail /dev/md0 /dev/sdx
>  mdadm --remove /dev/md0 /dev/sdx
>  mdadm --stop /dev/md0 /dev/sdx
>  mdadm --add /dev/md0 /dev/sdx
>  mdadm --run /dev/md0 /dev/sdx

Btw, the MD_BROKEN patch conflicts with one of Neil's patches. Please 
rebase your work on top of

https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/tree/?h=md-next

Thanks,
Song




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
