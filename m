Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8C65C23F548
	for <lists+dm-devel@lfdr.de>; Sat,  8 Aug 2020 01:36:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-7yGM5EZbPga_kdcnA07ZaA-1; Fri, 07 Aug 2020 19:36:26 -0400
X-MC-Unique: 7yGM5EZbPga_kdcnA07ZaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA61318C63F9;
	Fri,  7 Aug 2020 23:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99C4265C91;
	Fri,  7 Aug 2020 23:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FD971809554;
	Fri,  7 Aug 2020 23:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077NZqvg004338 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 19:35:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2236311E6B6; Fri,  7 Aug 2020 23:35:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D91B11E6B2
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 23:35:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1380580029D
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 23:35:50 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-xztjDv8RMUSIJyuTTbgNlw-1; Fri, 07 Aug 2020 19:35:45 -0400
X-MC-Unique: xztjDv8RMUSIJyuTTbgNlw-1
Received: by mail-pf1-f176.google.com with SMTP id d22so1947528pfn.5;
	Fri, 07 Aug 2020 16:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/Z6xg4us9klyutIW9aIQn+0iIZLh+9gAn5/KpmgqWu8=;
	b=WQJFOyjvuko2AVfIqWmkJYaXR10wjmXaDn6Z7PlCLWeFvFgeFGHxzxl9qQqzhCAZeV
	L9HK+IfTcff02EYVICtB/Lv2yyJvFWQNgLlFhAEqebjTzFSf2S4snL1hVks4oD9bqtwa
	YH6B/+9WfTFUJ5fmfw0hwJibaeiObGgcSjArp1wdu9JrRIh8yT8KIn6iOzcHzbzk/oTv
	+OTDjTfIg1W6LKC6IhjtgrKOkJ2G0PzrsK3mlAWuXq6tHn7dH9MgbP0hDsGO4aO4hm1e
	a0yydCby/uzRn7xkwRKckov2N+cCRzlEecvUKhIYGSMxSqURWn5BhMDWPTbWdXkQly92
	ZSsQ==
X-Gm-Message-State: AOAM5338nPM4nrI4U88Zy/tZaJIyjOORPOIimX3EVQGKFG44BGK7E2RQ
	MVvd2renubvUaSFsZV44HQw=
X-Google-Smtp-Source: ABdhPJwBSnLehAvPI+JwFLD7el9EmA7Uj4d8XdvGO1Nk7UUtPu75h3OvaCh4yfpw7fWEfYLo+tNb/Q==
X-Received: by 2002:a63:8943:: with SMTP id v64mr13138426pgd.261.1596843344523;
	Fri, 07 Aug 2020 16:35:44 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:3dec:a6f0:8cde:ad1c?
	([2601:647:4802:9070:3dec:a6f0:8cde:ad1c])
	by smtp.gmail.com with ESMTPSA id
	z15sm9090661pjz.12.2020.08.07.16.35.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Aug 2020 16:35:43 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200805152905.GB1982647@dhcp-10-100-145-180.wdl.wdc.com>
	<255d55e3-f824-a968-e478-3efeda095696@huawei.com>
	<20200806142625.GA3075319@dhcp-10-100-145-180.wdl.wdc.com>
	<729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
Date: Fri, 7 Aug 2020 16:35:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807045015.GA29737@redhat.com>
Content-Language: en-US
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
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] nvme: restore use of blk_path_error() in
	nvme_complete_rq()
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


>> Hey Mike,
>>
>>>> The point is: blk_path_error() has nothing to do with NVMe errors.
>>>> This is dm-multipath logic stuck in the middle of the NVMe error
>>>> handling code.
>>>
>>> No, it is a means to have multiple subsystems (to this point both SCSI
>>> and NVMe) doing the correct thing when translating subsystem specific
>>> error codes to BLK_STS codes.
>>
>> Not exactly, don't find any use of this in scsi. The purpose is to make
>> sure that nvme and dm speak the same language.
> 
> SCSI doesn't need to do additional work to train a multipath layer
> because dm-multipath _is_ SCSI's multipathing in Linux.

Agree.

> So ensuring SCSI properly classifies its error codes happens as a
> side-effect of ensuring continued multipath functionality.
> 
> Hannes introduced all these differentiated error codes in block core
> because of SCSI.  NVMe is meant to build on the infrastructure that was
> established.

Yes, exactly my point. blk_path_error is designed to make nvme and 
dm-multipath speak the same language.

>>> If you, or others you name drop below, understood the point we wouldn't
>>> be having this conversation.  You'd accept the point of blk_path_error()
>>> to be valid and required codification of what constitutes a retryable
>>> path error for the Linux block layer.
>>
>> This incident is a case where the specific nvme status was designed
>> to retry on the same path respecting the controller retry delay.
>> And because nvme used blk_path_error at the time it caused us to use a
>> non-retryable status to get around that. Granted, no one had
>> dm-multipath in mind.
>>
>> So in a sense, there is consensus on changing patch 35038bffa87da
>> _because_ nvme no longer uses blk_path_error. Otherwise it would break.
> 
> "break" meaning it would do failover instead of the more optimal local
> retry to the same controller.
> 
> I see.  Wish the header for commit 35038bffa87da touched on this even a
> little bit ;)

I think it did, but maybe didn't put too much emphasis on it.

> But AFAICT the patch I provided doesn't compromise proper local retry --
> as long as we first fix nvme_error_status() to return a retryable
> BLK_STS for NVME_SC_CMD_INTERRUPTED -- which I assumed as a prereq.
> 
> Think of blk_path_error() as a more coarse-grained "is this retryable or
> a hard failure?" check.  So for NVME_SC_CMD_INTERRUPTED,
> nvme_error_status() _should_ respond with something retryable (I'd
> prefer BLK_STS_RESOURCE to be honest).

But blk_path_error semantically mean "is this a pathing error", or at
least that what its name suggest.

> And then nvme_failover_req() is finer-grained; by returning false it now
> allows short-circuiting failover and reverting back to NVMe's normal
> controller based error recovery -- which it does for
> NVME_SC_CMD_INTERRUPTED due to "default" case in nvme_failover_req().
> 
> And then the previous nvme_error_status() classification of retryable
> BLK_STS obviously never gets returned up the IO stack; it gets thrown
> away.

I see what you are saying. The issue is that the code becomes
convoluted (it's a pathing error, oh wait, no its not a pathing error).

>>> Any BLK_STS mapping of NVMe specific error codes would need to not screw
>>> up by categorizing a retryable error as non-retryable (and vice-versa).
>>
>> But it is a special type of retryable. There is nothing that fits the
>> semantics of the current behavior.
> 
> I agree.  But that's fine actually.
> 
> And this issue is the poster-child for why properly supporting a duality
> of driver-level vs upper level multipathing capabilities is pretty much
> impossible unless a clean design factors out the different error classes
> -- and local error retry is handled before punting to higher level
> failover retry.  Think if NVMe were to adopt a bit more disciplined
> "local then failover" error handling it all gets easier.

I don't think punting before is easier, because we do a local retry if:
- no multipathing sw on top
- request needs retry (e.g. no DNR, notretry is off etc..)
- nvme error is not pathing related (nvme_failover_req returned false)

> This local retry _is_ NVMe specific.  NVMe should just own retrying on
> the same controller no matter what (I'll hope that such retry has
> awareness to not retry indefinitely though!).

it will retry until the retry limit.

>  And this has nothing to
> do with multipathing, so the logic to handle it shouldn't be trapped in
> nvme_failover_req().

Well given that nvme_failover_req already may not actually failover this
makes some sense to me (although I did have some resistance to make it
that way in the first place, but was convinced otherwise).

> I think NVMe can easily fix this by having an earlier stage of checking,
> e.g. nvme_local_retry_req(), that shortcircuits ever getting to
> higher-level multipathing consideration (be it native NVMe or DM
> multipathing) for cases like NVME_SC_CMD_INTERRUPTED.
> To be clear: the "default" case of nvme_failover_req() that returns
> false to fallback to NVMe's "local" normal NVMe error handling -- that
> can stay.. but a more explicit handling of cases like
> NVME_SC_CMD_INTERRUPTED should be added to a nvme_local_retry_req()
> check that happens before nvme_failover_req() in nvme_complete_rq().

I don't necessarily agree with having a dedicated nvme_local_retry_req().
a request that isn't failed over, goes to local error handling (retry or
not). I actually think that just adding the condition to
nvme_complete_req and having nvme_failover_req reject it would work.

Keith?

>>> Anyway, no new BLK_STS is needed at this point.  More discipline with
>>> how NVMe's error handling is changed is.
>>
>> Please read the above.
> 
> I agree we'd need a new BLK_STS only if NVMe cannot be made to trap
> NVME_SC_CMD_INTERRUPTED for local retry _before_ considering path
> failover.

Not sure that is better, but we can see a patch first to determine.

>>> If NVMe wants to ensure its
>>> interface isn't broken regularly it _should_ use blk_path_error() to
>>> validate future nvme_error_status() changes.  Miscategorizing NVMe
>>> errors to upper layers is a bug -- not open for debate.
>>
>> Again, don't agree is a Miscategorization nor a bug, its just something
>> that is NVMe specific.
> 
> Right I understand.
> 
> Think it safe to assume these types of details are why Christoph wanted
> to avoid the notion of native NVMe and DM multipathing having
> compatible error handling.  There was some wisdom with that position
> (especially with native NVMe goals in mind).  But if things are tweaked
> slightly then both camps _can_ be made happy.
> 
> There just needs to be a willingness to work through the details,
> defensiveness needs to be shed on both sides, so constructive
> review/consideration of problems can happen.

Agreed.

> Think that has already
> happened here with our exchange.  I'm open to investing effort here if
> others are up for humoring my attempt to explore fixing the issues in a
> mutually beneficial way.  What's the worst that can happen?  My simple
> patches might continue to be ignored? ;)

I won't ignore it, and I apologize of ignoring the original patch 
posted, I guess it flew under the radar...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

