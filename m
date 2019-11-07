Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59A41F46D9
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 12:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573213550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8ZpZ4GurfksCjeRlfRB0w6pMZYrAYQlI/SHaUVyx2gE=;
	b=KeoaAVK38TiGkgP+JiUNadDoYmPCv0mg0OWk7aC9cP84aR/n8wH87CxucShfn3ngp7dSmI
	fKdhFUPhTrFyE7Ws+YnQjDRM6CKIMzo6KTEwwKF7/fs/s45w+Jaqjtefy22ySuSVfPr9ix
	arXEe9oUutLSUOfMn5P0IEZudbv/wyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ct-8uCDCNteJfn1Q1S0m5w-1; Fri, 08 Nov 2019 06:45:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE563FB;
	Fri,  8 Nov 2019 11:45:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D4D0271B4;
	Fri,  8 Nov 2019 11:45:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 746C14BB65;
	Fri,  8 Nov 2019 11:45:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7JUAc1013761 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:30:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89145600F0; Thu,  7 Nov 2019 19:30:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FEA6600D3
	for <dm-devel@redhat.com>; Thu,  7 Nov 2019 19:30:07 +0000 (UTC)
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
	[192.185.145.125])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B940E859FB
	for <dm-devel@redhat.com>; Thu,  7 Nov 2019 19:30:04 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway32.websitewelcome.com (Postfix) with ESMTP id 16E9E7369EA
	for <dm-devel@redhat.com>; Thu,  7 Nov 2019 13:30:04 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id SnTliRf2MiJ43SnTmi10dm; Thu, 07 Nov 2019 13:30:04 -0600
X-Authority-Reason: nr=8
Received: from [196.145.3.46] (port=4913 helo=[192.168.100.138])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iSnTl-0024l2-0Q; Thu, 07 Nov 2019 12:30:01 -0700
To: Mike Snitzer <snitzer@redhat.com>
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
	<8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
	<20191106150831.GA27888@redhat.com>
	<5370f009-c324-1530-4400-adf1b59f0bbd@petasan.org>
	<20191107190958.GA2821@redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
Date: Thu, 7 Nov 2019 21:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20191107190958.GA2821@redhat.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.145.3.46
X-Source-L: No
X-Exim-ID: 1iSnTl-0024l2-0Q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.138]) [196.145.3.46]:4913
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 4
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Thu, 07 Nov 2019 19:30:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 07 Nov 2019 19:30:04 +0000 (UTC) for IP:'192.185.145.125'
	DOMAIN:'gateway32.websitewelcome.com'
	HELO:'gateway32.websitewelcome.com' FROM:'mmokhtar@petasan.org'
	RCPT:''
X-RedHat-Spam-Score: 0.551  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_NEUTRAL) 192.185.145.125 gateway32.websitewelcome.com
	192.185.145.125 gateway32.websitewelcome.com
	<mmokhtar@petasan.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 08 Nov 2019 06:44:42 -0500
Cc: dm-devel@redhat.com, mpatocka@redhat.com
Subject: Re: [dm-devel] dm-writecache: change config parameters using
	messages
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ct-8uCDCNteJfn1Q1S0m5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 07/11/2019 21:09, Mike Snitzer wrote:
> On Thu, Nov 07 2019 at  1:55pm -0500,
> Maged Mokhtar <mmokhtar@petasan.org> wrote:
> 
>>
>>
>> On 06/11/2019 17:08, Mike Snitzer wrote:
>>> On Tue, Nov 05 2019 at  4:19pm -0500,
>>> Maged Mokhtar <mmokhtar@petasan.org> wrote:
>>>
>>>> Gentle ping please.
>>>>
>>>> It could add flexibility in changing cache parameters after device creation.
>>>
>>> I'm inclined to _not_ take this type of change.
>>>
>>> Why isn't changing the config parameters via table reload viable for
>>> you?
>>>
>>
>>
>> Hi Mike,
>>
>> Thank you for your response. The main issue is to enable setting
>> some config parameters while the device is mounted and running and
>> avoid calling target ctr() by sending parameter changes via
>> messages. A similar setup was used in dm-cache.
>>
>> The reason is that tuning the write cache may require run time
>> changes. If un-tuned we can observes periods of spikes and/or step
>> like disk utilization on the slow device during writeback using
>> iostat, and these spikes correspond to periods of increased client
>> io latency. Utilization can be tuned by varying the number of active
>> writeback jobs + the gap between high and low marks to achieve a
>> smooth high utilization.  Such tuning is difficult to do when
>> creating the cache device as it depends on the hardware and io
>> workload. We are hoping to use some userspace monitoring and tuning
>> tool to periodically adjust these values while the device is
>> running.
> 
> I think you're missing that any actively used DM device can be
> suspended, table reloaded, resumed.  So the tuning at runtime is still
> possible, it just requires more steps.
> 
> And I'm saying that unless/until there is a better reason other than
> "dm-cache allowed tuning via messages" I'm not interested in having
> multiple methods for tuning dm-writecache.
> 
> Mike
> 
just for my understanding, does not table reload call _ctr() and 
re-initializes things like threads/read metadada ..?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

