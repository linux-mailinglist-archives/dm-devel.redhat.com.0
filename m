Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5BC62C0186
	for <lists+dm-devel@lfdr.de>; Mon, 23 Nov 2020 09:40:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-GV_VYQYLNaC57H3m4hCoRQ-1; Mon, 23 Nov 2020 03:40:30 -0500
X-MC-Unique: GV_VYQYLNaC57H3m4hCoRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE54B107565A;
	Mon, 23 Nov 2020 08:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F2560C47;
	Mon, 23 Nov 2020 08:40:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B1C81809CA2;
	Mon, 23 Nov 2020 08:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKNeLNq025872 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 18:40:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 132842026D48; Fri, 20 Nov 2020 23:40:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2422026D47
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 23:40:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAFD6185A7BC
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 23:40:18 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-512-c3LcyviLM_yFzHjyhEri8w-1;
	Fri, 20 Nov 2020 18:40:14 -0500
X-MC-Unique: c3LcyviLM_yFzHjyhEri8w-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5F08E20B717A;
	Fri, 20 Nov 2020 15:40:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5F08E20B717A
To: Mimi Zohar <zohar@linux.ibm.com>,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com, paul@paul-moore.com
References: <20201119232611.30114-1-tusharsu@linux.microsoft.com>
	<20201119232611.30114-9-tusharsu@linux.microsoft.com>
	<4634c6c12b2452849f73ed2d5a4d168707e0ac9a.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <0fb07bd3-c877-ab0f-cd45-dcfbe1fec044@linux.microsoft.com>
Date: Fri, 20 Nov 2020 15:40:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4634c6c12b2452849f73ed2d5a4d168707e0ac9a.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 03:39:39 -0500
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v6 8/8] selinux: measure state and hash of
 the policy using IMA
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 11/20/20 7:49 AM, Mimi Zohar wrote:
Hi Mimi,

> 
> On Thu, 2020-11-19 at 15:26 -0800, Tushar Sugandhi wrote:
>> From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>
>> IMA measures files and buffer data such as keys, command line arguments
>> passed to the kernel on kexec system call, etc. While these measurements
>> enable monitoring and validating the integrity of the system, it is not
>> sufficient.
> 
> The above paragraph would make a good cover letter introduction.

Agreed - will add this paragraph to the cover letter as well.

> 
>> In-memory data structures maintained by various kernel
>> components store the current state and policies configured for
>> the components.
> 
> Various data structures, policies and state stored in kernel memory
> also impact the  integrity of the system.

Will update.

> 
> The 2nd paragraph could provide examples of such integrity critical
> data.

Will do.

> 
> This patch set introduces a new IMA hook named
> ima_measure_critical_data() to measure kernel integrity critical data.
> 

*Question*
I am not clear about this one - do you mean add the following line in 
the patch description for the selinux patch?

"This patch introduces the first use of the new IMA hook namely 
ima_measures_critical_data() to measure the integrity critical data for 
SELinux"

thanks,
  -lakshmi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

