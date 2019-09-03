Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6AA7E6D
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B1E583F3B;
	Wed,  4 Sep 2019 08:53:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C6496012E;
	Wed,  4 Sep 2019 08:53:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 737582551C;
	Wed,  4 Sep 2019 08:53:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83GVsgJ017592 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 12:31:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FE61194B9; Tue,  3 Sep 2019 16:31:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A845519C78;
	Tue,  3 Sep 2019 16:31:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id C84C4C058CB8;
	Tue,  3 Sep 2019 16:31:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A9C360;
	Tue,  3 Sep 2019 09:31:48 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59C973F246;
	Tue,  3 Sep 2019 09:31:47 -0700 (PDT)
To: Alexey Dobriyan <adobriyan@gmail.com>
References: <20190902210558.GA23013@avx2>
	<7b94004e-4a65-462b-cd6b-5cbd23d607bf@arm.com>
	<20190903162303.GA2173@avx2>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <64003dcd-d954-b76d-856a-214ff11ac000@arm.com>
Date: Tue, 3 Sep 2019 17:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903162303.GA2173@avx2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 03 Sep 2019 16:31:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 03 Sep 2019 16:31:49 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, peterz@infradead.org,
	aarcange@redhat.com, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, dm-devel@redhat.com, mingo@redhat.com
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 04 Sep 2019 08:53:27 +0000 (UTC)



On 03/09/2019 17:23, Alexey Dobriyan wrote:
> On Tue, Sep 03, 2019 at 12:02:38AM +0100, Valentin Schneider wrote:
>> struct task_struct {
>> 	struct thread_info         thread_info;          /*     0    24 */
>> 	volatile int               state;                /*    24     4 */
>>
>> 	/* XXX 4 bytes hole, try to pack */
>>
>> 	void *                     stack;                /*    32     8 */
>>
>> Though seeing as this is also the boundary of the randomized layout we can't
>> really do much better without changing the boundary itself. So much for
>> cacheline use :/
> 
> Cacheline use of task_struct is pretty hopeless because of all the ifdefs.
> 

Yeah I figured, then had a minute of silence for those forsaken bytes.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
