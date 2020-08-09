Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 69184240212
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 08:48:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-c7d3hlv2PHGviu1q8rz_iw-1; Mon, 10 Aug 2020 02:48:00 -0400
X-MC-Unique: c7d3hlv2PHGviu1q8rz_iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21B77102C7F4;
	Mon, 10 Aug 2020 06:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01F1B5C662;
	Mon, 10 Aug 2020 06:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A952097555;
	Mon, 10 Aug 2020 06:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 079HGhaG004777 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 9 Aug 2020 13:16:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A53DF7FCA; Sun,  9 Aug 2020 17:16:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 558AAF7FBC
	for <dm-devel@redhat.com>; Sun,  9 Aug 2020 17:16:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C626B8EFEE5
	for <dm-devel@redhat.com>; Sun,  9 Aug 2020 17:16:39 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-205-ZfuF7XAxNWG0uRH_IGBudA-1; Sun, 09 Aug 2020 13:16:33 -0400
X-MC-Unique: ZfuF7XAxNWG0uRH_IGBudA-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	079H3DTj149707; Sun, 9 Aug 2020 13:16:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32sr4qdvbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 09 Aug 2020 13:16:32 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 079H3Fof149899;
	Sun, 9 Aug 2020 13:16:31 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32sr4qdvbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 09 Aug 2020 13:16:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	079HG5EI011619; Sun, 9 Aug 2020 17:16:29 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 32skp81cqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 09 Aug 2020 17:16:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 079HGRT320054392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 9 Aug 2020 17:16:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4105F11C058;
	Sun,  9 Aug 2020 17:16:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B839C11C050;
	Sun,  9 Aug 2020 17:16:21 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.25.223])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  9 Aug 2020 17:16:21 +0000 (GMT)
Message-ID: <da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Chuck Lever <chucklever@gmail.com>, James Morris <jmorris@namei.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Sun, 09 Aug 2020 13:16:09 -0400
In-Reply-To: <329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-09_09:2020-08-06,
	2020-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 spamscore=0
	clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
	priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
	mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2006250000 definitions=main-2008090130
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 02:47:26 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, Paul, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-08 at 13:47 -0400, Chuck Lever wrote:
> > On Aug 5, 2020, at 2:15 PM, Mimi Zohar <zohar@linux.ibm.com> wrote:

<snip>

> > If block layer integrity was enough, there wouldn't have been a need
> > for fs-verity.   Even fs-verity is limited to read only filesystems,
> > which makes validating file integrity so much easier.  From the
> > beginning, we've said that fs-verity signatures should be included in
> > the measurement list.  (I thought someone signed on to add that support
> > to IMA, but have not yet seen anything.)
> 
> Mimi, when you and I discussed this during LSS NA 2019, I didn't fully
> understand that you expected me to implement signed Merkle trees for all
> filesystems. At the time, it sounded to me like you wanted signed Merkle
> trees only for NFS files. Is that still the case?

I definitely do not expect you to support signed Merkle trees for all
filesystems.  My interested is from an IMA perspective of measuring and
verifying the fs-verity Merkle tree root (and header info) signature. 
This is independent of which filesystems support it.

> 
> The first priority (for me, anyway) therefore is getting the ability to
> move IMA metadata between NFS clients and servers shoveled into the NFS
> protocol, but that's been blocked for various legal reasons.

Up to now, verifying remote filesystem file integrity has been out of
scope for IMA.   With fs-verity file signatures I can at least grasp
how remote file integrity could possibly work.  I don't understand how
remote file integrity with existing IMA formats could be supported. You
might want to consider writing a whitepaper, which could later be used
as the basis for a patch set cover letter.

Mimi

> 
> IMO we need agreement from everyone (integrity developers, FS
> implementers, and Linux distributors) that a signed Merkle tree IMA
> metadata format, stored in either an xattr or appended to an executable
> file, will be the way forward for IMA in all filesystems.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

