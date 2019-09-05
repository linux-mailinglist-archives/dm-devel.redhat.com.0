Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D07AB402
	for <lists+dm-devel@lfdr.de>; Fri,  6 Sep 2019 10:28:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6DD810F2400;
	Fri,  6 Sep 2019 08:28:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA8E100197A;
	Fri,  6 Sep 2019 08:28:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2ABA82551C;
	Fri,  6 Sep 2019 08:28:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x85GqdsX012482 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 12:52:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0142260610; Thu,  5 Sep 2019 16:52:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 948736092F;
	Thu,  5 Sep 2019 16:52:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id F21D23082E6E;
	Thu,  5 Sep 2019 16:52:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D10D28;
	Thu,  5 Sep 2019 09:52:34 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4354C3F718;
	Thu,  5 Sep 2019 09:52:33 -0700 (PDT)
To: Markus Elfring <Markus.Elfring@web.de>,
	Alexey Dobriyan <adobriyan@gmail.com>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, rcu@vger.kernel.org
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
Date: Thu, 5 Sep 2019 17:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 05 Sep 2019 16:52:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 05 Sep 2019 16:52:36 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 04:27:24 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Fri, 06 Sep 2019 08:28:24 +0000 (UTC)



On 05/09/2019 16:51, Markus Elfring wrote:
> Can a transformation approach like the following work also
> for your software?
> 
> @replacement@
> 
> identifier func, p, state_var;
> 
> @@
> 
>  func(...,
>       struct task_struct *p,
>       ...
> ,
> -     long
> +     int
>       state_var
> ,
>       ...)
> 
>  {
> 
>  ...
> 
>  }
> 
> 

I actually got rid of the task_struct* parameter and now just match
against task_struct.p accesses in the function body, which has the
added bonus of not caring about the order of the parameters.

Still not there yet but making progress in the background, hope it's
passable entertainment to see me struggle my way there :)

> 
> Regards,
> Markus
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
