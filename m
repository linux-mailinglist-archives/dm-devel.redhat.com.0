Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 72963226B78
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 18:43:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ejCvrjTNOC-BJohqRsKaFw-1; Mon, 20 Jul 2020 12:43:06 -0400
X-MC-Unique: ejCvrjTNOC-BJohqRsKaFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA85B1005510;
	Mon, 20 Jul 2020 16:42:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4EE92DE60;
	Mon, 20 Jul 2020 16:42:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1086F1809554;
	Mon, 20 Jul 2020 16:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KGgF5L012793 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 12:42:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD62F109094D; Mon, 20 Jul 2020 16:42:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8B1910D18D6
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 16:42:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCBA31012443
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 16:42:12 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-334-lVZyHlgtN0aKDgfzaYzohQ-1;
	Mon, 20 Jul 2020 12:42:08 -0400
X-MC-Unique: lVZyHlgtN0aKDgfzaYzohQ-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id D40D020B4909;
	Mon, 20 Jul 2020 09:42:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D40D020B4909
To: Casey Schaufler <casey@schaufler-ca.com>, agk@redhat.com, axboe@kernel.dk, 
	snitzer@redhat.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, viro@zeniv.linux.org.uk, paul@paul-moore.com,
	eparis@redhat.com, jannh@google.com, dm-devel@redhat.com,
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-audit@redhat.com
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
	<20200717230941.1190744-6-deven.desai@linux.microsoft.com>
	<1843d707-c62e-fa13-c663-c123ea1205a0@schaufler-ca.com>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <e82dbf6b-e90d-205b-62d1-b7cd8b5df844@linux.microsoft.com>
Date: Mon, 20 Jul 2020 09:42:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1843d707-c62e-fa13-c663-c123ea1205a0@schaufler-ca.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, nramas@linux.microsoft.com,
	tyhicks@linux.microsoft.com, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v4 05/12] fs: add security blob and hooks
 for block_device
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 7/17/2020 5:14 PM, Casey Schaufler wrote:

[...snip]

>> +EXPORT_SYMBOL(security_bdev_free);
>> +
>> +int security_bdev_setsecurity(struct block_device *bdev,
>> +			      const char *name, const void *value,
>> +			      size_t size)
>> +{
>> +	return call_int_hook(bdev_setsecurity, 0, bdev, name, value, size);
>> +}
> 
> What is your expectation regarding multiple security modules using the
> same @name? What do you expect a security module to do if it does not
> support a particular @name? You may have a case where SELinux supports
> a @name that AppArmor (or KSRI) doesn't. -ENOSYS may be you friend here.
> 

I expect that some security modules may want to use the same @name / use
the data contained with @name. I cannot speak to the future cases of
other LSMs, but I expect if they want the raw @value, they'll copy it
into their security blob, or interpret @value to a field defined by
their security blob.

Originally, I expected a security module that does not implement a
particular @name no-op with return 0, not -ENOSYS, but I recognize that
error codes are valuable, and it's a trivial change - I'll switch the 
security hook to call the hooks while allowing -ENOSYS or 0 in the next 
iteration.

>> +EXPORT_SYMBOL(security_bdev_setsecurity);
>> +
>>   #ifdef CONFIG_PERF_EVENTS
>>   int security_perf_event_open(struct perf_event_attr *attr, int type)
>>   {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

