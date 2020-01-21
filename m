Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD265144D4E
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579681311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SylNS3qYwygrWhbi7r6EGRRD+zMq7QA8o+WW3802ywc=;
	b=MgyufHB4/3zUFypjEcrSxYDYucEIIctnd16ywJyW6Rb8wG+KG3vUmqPWt7iXfKj3Iu95tO
	mQ/VTRSxW326o+DnUpwLp4qg/jBBtAcqZ1VCh+g5TGCMpiqxppdv4YktmxVC/TknwngwrQ
	uIn0yZkkQny4H+sanCumQd1OMs2SZik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-uhPbdUBlNe2FoqjoqqgaZA-1; Wed, 22 Jan 2020 03:21:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D0A14E8;
	Wed, 22 Jan 2020 08:21:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6822898C;
	Wed, 22 Jan 2020 08:21:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AF10180880C;
	Wed, 22 Jan 2020 08:21:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LFE1VV024134 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 10:14:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2DA942166B31; Tue, 21 Jan 2020 15:14:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 297A72166B2A
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 15:13:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F3B802A4E
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 15:13:58 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-389-G2uEFUMEOqitOaNB8BFy4Q-1;
	Tue, 21 Jan 2020 10:13:54 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1itvDk-0001Vx-Rr; Tue, 21 Jan 2020 18:13:37 +0300
To: Mike Snitzer <snitzer@redhat.com>
References: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
	<157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
	<20200121122458.GA9365@redhat.com>
	<f7e0fb38-a894-da33-c46b-e192ed907ee0@virtuozzo.com>
	<619a7a14-44e6-eca7-c1ea-3f04abeee53d@virtuozzo.com>
	<20200121134840.GA9944@redhat.com>
	<a19d5957-9aaa-b518-5855-e5fa2b5d3b22@virtuozzo.com>
	<20200121144310.GA10055@redhat.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <2b393b74-952e-10ff-9f2c-4ea19cf74f88@virtuozzo.com>
Date: Tue, 21 Jan 2020 18:13:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121144310.GA10055@redhat.com>
Content-Language: en-US
X-MC-Unique: G2uEFUMEOqitOaNB8BFy4Q-1
X-MC-Unique: uhPbdUBlNe2FoqjoqqgaZA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LFE1VV024134
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 03:20:59 -0500
Cc: andrea.parri@amarulasolutions.com, dhowells@redhat.com, song@kernel.org,
	dm-devel@redhat.com, adilger.kernel@dilger.ca, osandov@fb.com,
	agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v4 6/7] dm: Directly disable
	max_allocate_sectors for now
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21.01.2020 17:43, Mike Snitzer wrote:
> On Tue, Jan 21 2020 at  9:20am -0500,
> Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
> 
>> On 21.01.2020 16:48, Mike Snitzer wrote:
>>> On Tue, Jan 21 2020 at  8:33am -0500,
>>> Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
>>>
>>>> On 21.01.2020 15:36, Kirill Tkhai wrote:
>>>>> On 21.01.2020 15:24, Mike Snitzer wrote:
>>>>>> On Tue, Jan 21 2020 at  5:42am -0500,
>>>>>> Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
>>>>>>
>>>>>>> Since dm inherits limits from underlining block devices,
>>>>>>> this patch directly disables max_allocate_sectors for dm
>>>>>>> till full allocation support is implemented.
>>>>>>>
>>>>>>> This prevents high-level primitives (generic_make_request_checks(),
>>>>>>> __blkdev_issue_write_zeroes(), ...) from sending REQ_ALLOCATE
>>>>>>> requests.
>>>>>>>
>>>>>>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>>>>>>> ---
>>>>>>>  drivers/md/dm-table.c |    2 ++
>>>>>>>  drivers/md/md.h       |    1 +
>>>>>>>  2 files changed, 3 insertions(+)
>>>>>>
>>>>>> You're mixing DM and MD changes in the same patch.
>>>>>>
>>>>>> But I'm wondering if it might be best to set this default for stacking
>>>>>> devices in blk_set_stacking_limits()?
>>>>>>
>>>>>> And then it is up to each stacking driver to override as needed.
>>>>>
>>>>> Hm. Sound like a good idea. This "lim->max_allocate_sectors = 0" in blk_set_stacking_limits()
>>>>> should work for dm's dm_calculate_queue_limits(), since it calls blk_stack_limits(), which is:
>>>>>
>>>>> 	t->max_allocate_sectors = min(t->max_allocate_sectors,
>>>>> 				      b->max_allocate_sectors);
>>>>>
>>>>> Could you please tell is this fix is also enough for md?
>>>>
>>>> It looks like it's enough since queue defaults are set in md_alloc()->blk_set_stacking_limits().
>>>> In case of we set "max_allocate_sectors = 0", in further it can be changed only manually,
>>>> but nobody does this.
>>>
>>> Yes, it will work to disable this capability for MD and DM.
>>>
>>> But if/when a stacked device _dooes_ want to support this then it'll be
>>> awkward to override this stacking default to allow blk_stack_limits()
>>> to properly stack up this limit.  blk_limits are extremely fiddley so
>>> this isn't necessarily new.  But by explicitly defaulting to 0 and then
>>> having blk_stack_limits use min() for this limit: it results in stacking
>>> drivers needing to clumsily unwind the default.  E.g. DM will need to
>>> tweak its blk_stack_limits() related code to allow override that
>>> actually _does_  stack up the underlying devices' capability (and not
>>> just impose its own limit that ignores the underlying devices).
>>>
>>> So I'm not convinced this is the right way to go (be it the v4 approach
>>> you took or the cleaner use of blk_set_stacking_limits I suggested).
>>
>> Is there a strong vision about the way we should go? Or you leave this choose
>> up to me?
> 
> I don't have time to work through it at the moment (e.g. implementing
> dm-thinp support to know what the block core code should be) so I'll
> just defer to you on a disabling it for now.
> 
>>> And to be clear, I'm interested in having DM thinp support this
>>> capability to preallocate blocks.
>>
>> My opinion is it would be better to not mix several subsystem related
>> support in a single patch set. Both of the approaches (v4 or that you
>> suggested) do not prevents us to implement allocation support in next
>> patch series. After we have the base functionality enabled, we may add
>> support in other subsystems and drivers one by one with more focus
>> on the subsystem specificities and with the best possible attention.
> 
> Yeah, I'm aware nothing is ever set in stone.
> 
> Setting to 0 in blk_set_stacking_limits() is OK for now.

I get your point. Thanks for the suggestion and comments, Mike.

Kirill


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

