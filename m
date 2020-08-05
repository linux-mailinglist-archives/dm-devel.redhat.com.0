Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 901A423D6A1
	for <lists+dm-devel@lfdr.de>; Thu,  6 Aug 2020 07:56:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-40UqGkAyOMiSefLSLBGp3Q-1; Thu, 06 Aug 2020 01:56:43 -0400
X-MC-Unique: 40UqGkAyOMiSefLSLBGp3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FB7101C8AA;
	Thu,  6 Aug 2020 05:56:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0A360C47;
	Thu,  6 Aug 2020 05:56:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD8801809554;
	Thu,  6 Aug 2020 05:56:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075IFcpM028522 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 14:15:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E590200BC5E; Wed,  5 Aug 2020 18:15:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19BC5217B436
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 18:15:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 030CB800161
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 18:15:35 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-H7zdi7QNM_CUU1xnL4zuQQ-1; Wed, 05 Aug 2020 14:15:30 -0400
X-MC-Unique: H7zdi7QNM_CUU1xnL4zuQQ-1
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	075I6IXI022298; Wed, 5 Aug 2020 14:15:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32qtnq5s58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 05 Aug 2020 14:15:29 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 075I6SBu023318;
	Wed, 5 Aug 2020 14:15:29 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.106])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32qtnq5s4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 05 Aug 2020 14:15:29 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	075IAP9d012198; Wed, 5 Aug 2020 18:15:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 32n018au5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 05 Aug 2020 18:15:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 075IFOpu33489240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 5 Aug 2020 18:15:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDB2EAE051;
	Wed,  5 Aug 2020 18:15:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42453AE055;
	Wed,  5 Aug 2020 18:15:19 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.95.205])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2020 18:15:19 +0000 (GMT)
Message-ID: <b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: James Morris <jmorris@namei.org>, James Bottomley
	<James.Bottomley@HansenPartnership.com>
Date: Wed, 05 Aug 2020 14:15:13 -0400
In-Reply-To: <alpine.LRH.2.21.2008050934060.28225@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-05_14:2020-08-03,
	2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0
	priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=999
	lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
	impostorscore=0
	clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2006250000 definitions=main-2008050141
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 06 Aug 2020 01:55:56 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 09:59 -0700, James Morris wrote:
> On Wed, 5 Aug 2020, James Bottomley wrote:
> 
> > I'll leave Mimi to answer, but really this is exactly the question that
> > should have been asked before writing IPE.  However, since we have the
> > cart before the horse, let me break the above down into two specific
> > questions.
> 
> The question is valid and it was asked. We decided to first prototype what 
> we needed and then evaluate if it should be integrated with IMA. We 
> discussed this plan in person with Mimi (at LSS-NA in 2019), and presented 
> a more mature version of IPE to LSS-NA in 2020, with the expectation that 
> such a discussion may come up (it did not).

When we first spoke the concepts weren't fully formulated, at least to
me.
> 
> These patches are still part of this process and 'RFC' status.
> 
> >    1. Could we implement IPE in IMA (as in would extensions to IMA cover
> >       everything).  I think the answers above indicate this is a "yes".
> 
> It could be done, if needed.
> 
> >    2. Should we extend IMA to implement it?  This is really whether from a
> >       usability standpoint two seperate LSMs would make sense to cover the
> >       different use cases.
> 
> One issue here is that IMA is fundamentally a measurement & appraisal 
> scheme which has been extended to include integrity enforcement. IPE was 
> designed from scratch to only perform integrity enforcement. As such, it 
> is a cleaner design -- "do one thing and do it well" is a good design 
> pattern.
> 
> In our use-case, we utilize _both_ IMA and IPE, for attestation and code 
> integrity respectively. It is useful to be able to separate these 
> concepts. They really are different:
> 
> - Code integrity enforcement ensures that code running locally is of known 
> provenance and has not been modified prior to execution.
> 
> - Attestation is about measuring the health of a system and having that 
> measurement validated by a remote system. (Local attestation is useless).
> 
> I'm not sure there is value in continuing to shoe-horn both of these into 
> IMA.

True, IMA was originally limited to measurement and attestation, but
most of the original EVM concepts were subsequently included in IMA. 
(Remember, Reiner Sailer wrote the original IMA, which I inherited.  I
was originially working on EVM code integrity.)  From a naming
perspective including EVM code integrity in IMA was a mistake.  My
thinking at the time was that as IMA was already calculating the file
hash, instead of re-calculating the file hash for integrity, calculate
the file hash once and re-use it for multiple things - measurement, 
integrity, and audit.   At the same time define a single system wide
policy.

When we first started working on IMA, EVM, trusted, and encrypted keys,
the general kernel community didn't see a need for any of it.  Thus, a
lot of what was accomplished has been accomplished without the backing
of the real core filesystem people.

If block layer integrity was enough, there wouldn't have been a need
for fs-verity.   Even fs-verity is limited to read only filesystems,
which makes validating file integrity so much easier.  From the
beginning, we've said that fs-verity signatures should be included in
the measurement list.  (I thought someone signed on to add that support
to IMA, but have not yet seen anything.)

Going forward I see a lot of what we've accomplished being incorporated
into the filesystems.  When IMA will be limited to defining a system
wide policy, I'll have completed my job.

Mimi

> 
> >  I've got to say the least attractive thing
> >       about separation is the fact that you now both have a policy parser.
> >        You've tried to differentiate yours by making it more Kconfig
> >       based, but policy has a way of becoming user space supplied because
> >       the distros hate config options, so I think you're going to end up
> >       with a policy parser very like IMAs.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

