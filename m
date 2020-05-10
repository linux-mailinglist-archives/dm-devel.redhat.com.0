Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B0F631CD3A1
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c0OGJkWenQ+Ov8+CDe5Dt13HVxRcINps4j7OxWWyqkg=;
	b=PIjRrrp5peYXs9A1Uu9EELrNJm6q0uF0X24k7YvGqu7zkVtj6rhtW7iF5pW9yXYekKyEYB
	LTdA54iSDMnAKERAth+8ZVLsbBVIwNt1z1qsE2zpLpqDXJh/FNRM8YsR4viWSJHQ3/6LbA
	0uoe1frSxaaKlz9O7T2TL+bThHanvb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-mTMdbqcQPcmQ6nofDG_wEw-1; Mon, 11 May 2020 04:19:00 -0400
X-MC-Unique: mTMdbqcQPcmQ6nofDG_wEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C268015CE;
	Mon, 11 May 2020 08:18:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161E07094B;
	Mon, 11 May 2020 08:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A64CB4CAA8;
	Mon, 11 May 2020 08:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04AAfp7b007786 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 10 May 2020 06:41:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B6C72029F61; Sun, 10 May 2020 10:41:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 876342029F6F
	for <dm-devel@redhat.com>; Sun, 10 May 2020 10:41:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73CF7811E77
	for <dm-devel@redhat.com>; Sun, 10 May 2020 10:41:49 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch
	[45.157.188.13]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-ZKWACm9FPq-1f3Og3Akwhg-1; Sun, 10 May 2020 06:41:47 -0400
X-MC-Unique: ZKWACm9FPq-1f3Og3Akwhg-1
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	49Kdz73c83zlhlbf; Sun, 10 May 2020 11:28:19 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [94.23.54.103])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id
	49Kdz52pvmzmgvLW; Sun, 10 May 2020 11:28:17 +0200 (CEST)
To: deven.desai@linux.microsoft.com, agk@redhat.com, axboe@kernel.dk,
	snitzer@redhat.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, jannh@google.com
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
Date: Sun, 10 May 2020 11:28:16 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, corbet@lwn.net,
	mdsakib@linux.microsoft.com, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v3 00/12] Integrity Policy Enforcement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 15/04/2020 18:25, deven.desai@linux.microsoft.com wrote:
> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> Overview:
> ------------------------------------
> 
> IPE is a Linux Security Module which allows for a configurable
> policy to enforce integrity requirements on the whole system. It
> attempts to solve the issue of Code Integrity: that any code being
> executed (or files being read), are identical to the version that
> was built by a trusted source.
> 
> The type of system for which IPE is designed for use is an embedded device
> with a specific purpose (e.g. network firewall device in a data center),
> where all software and configuration is built and provisioned by the owner.
> 
> Specifically, a system which leverages IPE is not intended for general
> purpose computing and does not utilize any software or configuration
> built by a third party. An ideal system to leverage IPE has both mutable
> and immutable components, however, all binary executable code is immutable.
> 
> The scope of IPE is constrained to the OS. It is assumed that platform
> firmware verifies the the kernel and optionally the root filesystem (e.g.
> via U-Boot verified boot). IPE then utilizes LSM hooks to enforce a
> flexible, kernel-resident integrity verification policy.
> 
> IPE differs from other LSMs which provide integrity checking (for instance,
> IMA), as it has no dependency on the filesystem metadata itself. The
> attributes that IPE checks are deterministic properties that exist solely
> in the kernel. Additionally, IPE provides no additional mechanisms of
> verifying these files (e.g. IMA Signatures) - all of the attributes of
> verifying files are existing features within the kernel, such as dm-verity
> or fsverity.
> 
> IPE provides a policy that allows owners of the system to easily specify
> integrity requirements and uses dm-verity signatures to simplify the
> authentication of allowed objects like authorized code and data.
> 
> IPE supports two modes, permissive (similar to SELinux's permissive mode)
> and enforce. Permissive mode performs the same checks, and logs policy
> violations as enforce mode, but will not enforce the policy. This allows
> users to test policies before enforcing them.
> 
> The default mode is enforce, and can be changed via the kernel commandline
> parameter `ipe.enforce=(0|1)`, or the sysctl `ipe.enforce=(0|1)`. The
> ability to switch modes can be compiled out of the LSM via setting the
> config CONFIG_SECURITY_IPE_PERMISSIVE_SWITCH to N.
> 
> IPE additionally supports success auditing. When enabled, all events
> that pass IPE policy and are not blocked will emit an audit event. This
> is disabled by default, and can be enabled via the kernel commandline
> `ipe.success_audit=(0|1)` or the sysctl `ipe.success_audit=(0|1)`.
> 
> Policies can be staged at runtime through securityfs and activated through
> sysfs. Please see the Deploying Policies section of this cover letter for
> more information.
> 
> The IPE LSM is compiled under CONFIG_SECURITY_IPE.
> 
> Policy:
> ------------------------------------
> 
> IPE policy is designed to be both forward compatible and backwards
> compatible. There is one required line, at the top of the policy,
> indicating the policy name, and the policy version, for instance:
> 
>   policy_name="Ex Policy" policy_version=0.0.0
> 
> The policy version indicates the current version of the policy (NOT the
> policy syntax version). This is used to prevent roll-back of policy to
> potentially insecure previous versions of the policy.
> 
> The next portion of IPE policy, are rules. Rules are formed by key=value
> pairs, known as properties. IPE rules require two properties: "action",
> which determines what IPE does when it encounters a match against the
> policy, and "op", which determines when that rule should be evaluated.
> Thus, a minimal rule is:
> 
>   op=EXECUTE action=ALLOW
> 
> This example will allow any execution. Additional properties are used to
> restrict attributes about the files being evaluated. These properties are
> intended to be deterministic attributes that are resident in the kernel.
> Available properties for IPE described in the properties section of this
> cover-letter, the repository available in Appendix A, and the kernel
> documentation page.
> 
> Order does not matter for the rule's properties - they can be listed in
> any order, however it is encouraged to have the "op" property be first,
> and the "action" property be last, for readability.
> 
> Additionally, rules are evaluated top-to-bottom. As a result, any
> revocation rules, or denies should be placed early in the file to ensure
> that these rules are evaluated before a rule with "action=ALLOW" is hit.
> 
> IPE policy is designed to be forward compatible and backwards compatible,
> thus any failure to parse a rule will result in the line being ignored,
> and a warning being emitted. If backwards compatibility is not required,
> the kernel commandline parameter and sysctl, ipe.strict_parse can be
> enabled, which will cause these warnings to be fatal.

Ignoring unknown command may lead to inconsistent beaviors. To achieve
forward compatibility, I think it would be better to never ignore
unknown rule but to give a way to userspace to known what is the current
kernel ABI. This could be done with a securityfs file listing the
current policy grammar.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

