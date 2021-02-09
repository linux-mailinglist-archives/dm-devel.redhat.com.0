Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4AD31DC81
	for <lists+dm-devel@lfdr.de>; Wed, 17 Feb 2021 16:39:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-6LDie8_MP0Cr5bmKvfJidg-1; Wed, 17 Feb 2021 10:39:16 -0500
X-MC-Unique: 6LDie8_MP0Cr5bmKvfJidg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01D8F107ACF3;
	Wed, 17 Feb 2021 15:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0ADD5D9C2;
	Wed, 17 Feb 2021 15:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A3CD18095CA;
	Wed, 17 Feb 2021 15:39:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1197C93n009224 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 02:12:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EED662026D11; Tue,  9 Feb 2021 07:12:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FC12026D48
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 07:12:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9322A858F18
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 07:12:06 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-183-P4gJkbMbOsuXx_9o5NgYsg-1;
	Tue, 09 Feb 2021 02:12:03 -0500
X-MC-Unique: P4gJkbMbOsuXx_9o5NgYsg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
	TI=SMTPD_---0UOHK40N_1612854404
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UOHK40N_1612854404) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 09 Feb 2021 15:06:45 +0800
To: Mike Snitzer <snitzer@redhat.com>
References: <20210202033528.76166-1-jefflexu@linux.alibaba.com>
	<20210205183909.GA4722@redhat.com>
	<59ca57e0-5a5f-33b6-24ed-90d615c40949@linux.alibaba.com>
	<20210208151700.GA22064@redhat.com> <20210209052959.GA25714@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <cdecf30e-cb66-a1cc-b7e0-749953af1e19@linux.alibaba.com>
Date: Tue, 9 Feb 2021 15:06:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209052959.GA25714@redhat.com>
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
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:31:26 -0500
Cc: joseph.qi@linux.alibaba.com, msb@chromium.org, dm-devel@redhat.com,
	toshi.kani@hpe.com, mbroz@redhat.com
Subject: Re: [dm-devel] dm: fix iterate_device sanity check
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2/9/21 1:29 PM, Mike Snitzer wrote:
> On Mon, Feb 08 2021 at 10:17am -0500,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
>> On Fri, Feb 05 2021 at  9:03pm -0500,
>> JeffleXu <jefflexu@linux.alibaba.com> wrote:
>>
>>>
>>>
>>> On 2/6/21 2:39 AM, Mike Snitzer wrote:
>>>> On Mon, Feb 01 2021 at 10:35pm -0500,
>>>> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>>>
>>>>> According to the definition of dm_iterate_devices_fn:
>>>>>  * This function must iterate through each section of device used by the
>>>>>  * target until it encounters a non-zero return code, which it then returns.
>>>>>  * Returns zero if no callout returned non-zero.
>>>>>
>>>>> For some target type (e.g., dm-stripe), one call of iterate_devices() may
>>>>> iterate multiple underlying devices internally, in which case a non-zero
>>>>> return code returned by iterate_devices_callout_fn will stop the iteration
>>>>> in advance.
>>>>>
>>>>> Thus if we want to ensure that _all_ underlying devices support some kind of
>>>>> attribute, the iteration structure like dm_table_supports_nowait() should be
>>>>> used, while the input iterate_devices_callout_fn should handle the 'not
>>>>> support' semantics. On the opposite, the iteration structure like
>>>>> dm_table_any_device_attribute() should be used if _any_ underlying device
>>>>> supporting this attibute is sufficient. In this case, the input
>>>>> iterate_devices_callout_fn should handle the 'support' semantics.
>>>>>
>>>>> Fixes: 545ed20e6df6 ("dm: add infrastructure for DAX support")
>>>>> Fixes: c3c4555edd10 ("dm table: clear add_random unless all devices have it set")
>>>>> Fixes: 4693c9668fdc ("dm table: propagate non rotational flag")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>>>>
>>>> Thanks for auditing and fixing this up.  It has been on my todo so
>>>> you've really helped me out -- your changes look correct to me.
>>>>
>>>> I've staged it for 5.12, the stable fix will likely need manual fixups
>>>> depending on the stable tree... we'll just need to assist with
>>>> backport(s) as needed.
>>>
>>> I'm glad to help offer the stable backport. But I don't know which
>>> kernel version the stable kernel is still being maintained. Also which
>>> mailing list I should send to when I finished backporting?
>>
>> All your v2 changes speak to needing more discipline in crafting
>> individual stable@ fixes that are applicable to various kernels.. when
>> all applied to mainline then it'd be the equivalent of your single
>> monolithic patch.
>>
>> But without splitting the changes into separate patches, for stable@'s
>> benefit, we'll have a much more difficult time of shepherding the
>> applicable changes into the disparate stable@ kernels.
>>
>> I'll have a look at splitting your v2 up accordingly.
> 
> Hi, please see these commits that I've staged in linux-next via:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=for-next
> 
> 1141b9133777 dm table: fix iterate_devices based device capability checks
> 0224c5e6fd07 dm table: fix DAX iterate_devices based device capability checks
> 76b0e14be03f dm table: fix zoned iterate_devices based device capability checks
> 55cdd7435e97 dm table: remove needless request_queue NULL pointer checks
> 

Thanks. This series looks good to me.

I suddenly find that the semantics of patch 1 (1141b9133777 dm table:
fix iterate_devices based device capability checks) is a little
different with the original context.

-	if (blk_queue_add_random(q) && dm_table_all_devices_attribute(t,
device_is_not_random))
+	if (dm_table_any_dev_attr(t, device_is_not_random))
 		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
+	else
+		blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);

In the original context, QUEUE_FLAG_ADD_RANDOM will only be cleared, it
won't be set, while it could be set after patch 1. But I could see no
harm of setting QUEUE_FLAG_ADD_RANDOM flag though.

FYI. Currently only scsi devices are still using QUEUE_FLAG_ADD_RANDOM
flag, as all non-rotational devices should not set this flag since
commit b277da0a8a59 ("block: disable entropy contributions for nonrot
devices").


-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

