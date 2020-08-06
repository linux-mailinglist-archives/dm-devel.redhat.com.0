Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 797AA23E9F4
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 11:18:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-osCJ3Hb-NUq6tdijwe2k7Q-1; Fri, 07 Aug 2020 05:18:21 -0400
X-MC-Unique: osCJ3Hb-NUq6tdijwe2k7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E550519057A1;
	Fri,  7 Aug 2020 09:18:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B02B35D9D5;
	Fri,  7 Aug 2020 09:18:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DCE21809554;
	Fri,  7 Aug 2020 09:17:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076EXidu006538 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 10:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A88BD10087C7; Thu,  6 Aug 2020 14:33:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 832BC10087D1
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 14:33:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673FE108C270
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 14:33:42 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-495-PrmLqIcsPyOI4eDhagkgmA-1; Thu, 06 Aug 2020 10:33:35 -0400
X-MC-Unique: PrmLqIcsPyOI4eDhagkgmA-1
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	076EX9ne003536; Thu, 6 Aug 2020 10:33:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32rhhk4k49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 06 Aug 2020 10:33:33 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 076EXXS4005245;
	Thu, 6 Aug 2020 10:33:33 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.71])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32rhhk4k38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 06 Aug 2020 10:33:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	076EVGC6007671; Thu, 6 Aug 2020 14:33:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 32n018bdfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 06 Aug 2020 14:33:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 076EW1RT62521766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 6 Aug 2020 14:32:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7DB4A4054;
	Thu,  6 Aug 2020 14:33:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A08B0A405B;
	Thu,  6 Aug 2020 14:33:22 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.58.181])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Aug 2020 14:33:22 +0000 (GMT)
Message-ID: <eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: James Morris <jmorris@namei.org>
Date: Thu, 06 Aug 2020 10:33:21 -0400
In-Reply-To: <alpine.LRH.2.21.2008060949410.20084@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<alpine.LRH.2.21.2008060949410.20084@namei.org>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-06_09:2020-08-06,
	2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0
	suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
	lowpriorityscore=0
	clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008060104
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 07 Aug 2020 05:17:45 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, paul@paul-moore.com,
	corbet@lwn.net, nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com,
	linux-kernel@vger.kernel.org, eparis@redhat.com,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-06 at 09:51 +1000, James Morris wrote:
> On Wed, 5 Aug 2020, Mimi Zohar wrote:
> 
> > If block layer integrity was enough, there wouldn't have been a need
> > for fs-verity.   Even fs-verity is limited to read only filesystems,
> > which makes validating file integrity so much easier.  From the
> > beginning, we've said that fs-verity signatures should be included in
> > the measurement list.  (I thought someone signed on to add that support
> > to IMA, but have not yet seen anything.)
> > 
> > Going forward I see a lot of what we've accomplished being incorporated
> > into the filesystems.  When IMA will be limited to defining a system
> > wide policy, I'll have completed my job.
> 
> What are your thoughts on IPE being a standalone LSM? Would you prefer to 
> see its functionality integrated into IMA?

Improving the integrity subsystem would be preferred.

Mimi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

