Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB71240215
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 08:48:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-LtUpKPncPoiWwq6MPMDaFQ-1; Mon, 10 Aug 2020 02:47:52 -0400
X-MC-Unique: LtUpKPncPoiWwq6MPMDaFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CB2100A8E8;
	Mon, 10 Aug 2020 06:47:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BF388BD62;
	Mon, 10 Aug 2020 06:47:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5096896912;
	Mon, 10 Aug 2020 06:47:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077IfFdt025939 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 14:41:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EAAF2166BA2; Fri,  7 Aug 2020 18:41:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37180217B435
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 18:41:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EADC28A5E5C
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 18:41:12 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-xTiJCoL8N_y6jGZyIiykRA-1; Fri, 07 Aug 2020 14:41:08 -0400
X-MC-Unique: xTiJCoL8N_y6jGZyIiykRA-1
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	077IWdDA138411; Fri, 7 Aug 2020 14:41:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32s06wdcdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 07 Aug 2020 14:41:07 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 077IXkH4142677;
	Fri, 7 Aug 2020 14:41:06 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32s06wdccq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 07 Aug 2020 14:41:06 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	077IbDhl014236; Fri, 7 Aug 2020 18:41:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 32mynh6wxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 07 Aug 2020 18:41:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 077If17q52167164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 7 Aug 2020 18:41:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E59FA4054;
	Fri,  7 Aug 2020 18:41:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0FAA405B;
	Fri,  7 Aug 2020 18:40:55 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.67.166])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  7 Aug 2020 18:40:55 +0000 (GMT)
Message-ID: <268edec96cbe7d2626c9158b806e8865b6b1b8ed.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: James Morris <jmorris@namei.org>
Date: Fri, 07 Aug 2020 14:40:54 -0400
In-Reply-To: <4a764c86a824a4b931dd7f130ce7afce7df140e4.camel@linux.ibm.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<alpine.LRH.2.21.2008060949410.20084@namei.org>
	<eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
	<alpine.LRH.2.21.2008080240350.13040@namei.org>
	<4a764c86a824a4b931dd7f130ce7afce7df140e4.camel@linux.ibm.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-07_16:2020-08-06,
	2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=999
	malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
	bulkscore=0
	impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
	clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008070128
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
X-Mailman-Approved-At: Mon, 10 Aug 2020 02:47:26 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-07 at 13:31 -0400, Mimi Zohar wrote:
> On Sat, 2020-08-08 at 02:41 +1000, James Morris wrote:
> > On Thu, 6 Aug 2020, Mimi Zohar wrote:
> > 
> > > On Thu, 2020-08-06 at 09:51 +1000, James Morris wrote:
> > > > On Wed, 5 Aug 2020, Mimi Zohar wrote:
> > > > 
> > > > > If block layer integrity was enough, there wouldn't have been a need
> > > > > for fs-verity.   Even fs-verity is limited to read only filesystems,
> > > > > which makes validating file integrity so much easier.  From the
> > > > > beginning, we've said that fs-verity signatures should be included in
> > > > > the measurement list.  (I thought someone signed on to add that support
> > > > > to IMA, but have not yet seen anything.)
> > > > > 
> > > > > Going forward I see a lot of what we've accomplished being incorporated
> > > > > into the filesystems.  When IMA will be limited to defining a system
> > > > > wide policy, I'll have completed my job.
> > > > 
> > > > What are your thoughts on IPE being a standalone LSM? Would you prefer to 
> > > > see its functionality integrated into IMA?
> > > 
> > > Improving the integrity subsystem would be preferred.
> > > 
> > 
> > Are you planning to attend Plumbers? Perhaps we could propose a BoF 
> > session on this topic.
> 
> That sounds like a good idea.

Other than it is already sold out.

Mimi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

