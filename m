Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3B22476A
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jul 2020 02:16:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Y7cMjxsfNHaq8KIGwH5n7w-1; Fri, 17 Jul 2020 20:16:20 -0400
X-MC-Unique: Y7cMjxsfNHaq8KIGwH5n7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6866B107ACCA;
	Sat, 18 Jul 2020 00:16:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD347555B;
	Sat, 18 Jul 2020 00:16:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB5881809554;
	Sat, 18 Jul 2020 00:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06I0FrFP008511 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 20:15:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 076062144B36; Sat, 18 Jul 2020 00:15:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034B32144B35
	for <dm-devel@redhat.com>; Sat, 18 Jul 2020 00:15:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA17585A5B3
	for <dm-devel@redhat.com>; Sat, 18 Jul 2020 00:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-191--igrCGGaO3-H8uX-iWoXoQ-1; Fri, 17 Jul 2020 20:15:48 -0400
X-MC-Unique: -igrCGGaO3-H8uX-iWoXoQ-1
Received: from [2601:1c0:6280:3f0::19c2]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwZb2-0005Vh-Az; Fri, 17 Jul 2020 23:16:52 +0000
To: Deven Bowers <deven.desai@linux.microsoft.com>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
	<20200717230941.1190744-3-deven.desai@linux.microsoft.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4b0c9925-d163-46a2-bbcb-74deb7446540@infradead.org>
Date: Fri, 17 Jul 2020 16:16:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717230941.1190744-3-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v4 02/12] security: add ipe lsm
 evaluation loop and audit system
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/17/20 4:09 PM, Deven Bowers wrote:
> +config SECURITY_IPE_PERMISSIVE_SWITCH
> +	bool "Enable the ability to switch IPE to permissive mode"
> +	default y
> +	help
> +	  This option enables two ways of switching IPE to permissive mode,
> +	  a sysctl (if enabled), `ipe.enforce`, or a kernel command line
> +	  parameter, `ipe.enforce`. If either of these are set to 0, files

	                                               is set

> +	  will be subject to IPE's policy, audit messages will be logged, but
> +	  the policy will not be enforced.
> +
> +	  If unsure, answer Y.


-- 
~Randy

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

