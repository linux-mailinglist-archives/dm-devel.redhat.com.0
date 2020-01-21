Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6530D144D4A
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579681307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=teVFNaVGR4IeUQNUbg0lZ66aXjSp4bRMdnTQWXqDAL4=;
	b=D261o846/YMkhnKVoBvTO0nxQqQRbEvWj8IcGXPy6+01Hf77//xvxquAeUpE4Iz4fd2zn3
	dZ1KGjj+SCPtgbtWeonrbmgOfghiW9qI76fKcJwafdGIz1zJn9hueOOsVBAExmZvsKicuh
	s2dAoTlWtZk7CO51uGyesu8ouem6FVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Vu0M06T6N_W2RbI04AbaUw-1; Wed, 22 Jan 2020 03:21:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59887DBA7;
	Wed, 22 Jan 2020 08:21:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB3D60E1C;
	Wed, 22 Jan 2020 08:21:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0E0C870A8;
	Wed, 22 Jan 2020 08:21:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LDYTMT017916 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 08:34:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 134432166B2A; Tue, 21 Jan 2020 13:34:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5C32166B2F
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 13:34:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 955E8800146
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 13:34:26 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-324-03MsM_ptNdyJMfWh9uOpkg-1;
	Tue, 21 Jan 2020 08:34:22 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1ittfD-0007u7-5X; Tue, 21 Jan 2020 16:33:51 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: Mike Snitzer <snitzer@redhat.com>
References: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
	<157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
	<20200121122458.GA9365@redhat.com>
	<f7e0fb38-a894-da33-c46b-e192ed907ee0@virtuozzo.com>
Message-ID: <619a7a14-44e6-eca7-c1ea-3f04abeee53d@virtuozzo.com>
Date: Tue, 21 Jan 2020 16:33:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f7e0fb38-a894-da33-c46b-e192ed907ee0@virtuozzo.com>
Content-Language: en-US
X-MC-Unique: 03MsM_ptNdyJMfWh9uOpkg-1
X-MC-Unique: Vu0M06T6N_W2RbI04AbaUw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LDYTMT017916
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21.01.2020 15:36, Kirill Tkhai wrote:
> On 21.01.2020 15:24, Mike Snitzer wrote:
>> On Tue, Jan 21 2020 at  5:42am -0500,
>> Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
>>
>>> Since dm inherits limits from underlining block devices,
>>> this patch directly disables max_allocate_sectors for dm
>>> till full allocation support is implemented.
>>>
>>> This prevents high-level primitives (generic_make_request_checks(),
>>> __blkdev_issue_write_zeroes(), ...) from sending REQ_ALLOCATE
>>> requests.
>>>
>>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>>> ---
>>>  drivers/md/dm-table.c |    2 ++
>>>  drivers/md/md.h       |    1 +
>>>  2 files changed, 3 insertions(+)
>>
>> You're mixing DM and MD changes in the same patch.
>>
>> But I'm wondering if it might be best to set this default for stacking
>> devices in blk_set_stacking_limits()?
>>
>> And then it is up to each stacking driver to override as needed.
> 
> Hm. Sound like a good idea. This "lim->max_allocate_sectors = 0" in blk_set_stacking_limits()
> should work for dm's dm_calculate_queue_limits(), since it calls blk_stack_limits(), which is:
> 
> 	t->max_allocate_sectors = min(t->max_allocate_sectors,
> 				      b->max_allocate_sectors);
> 
> Could you please tell is this fix is also enough for md?

It looks like it's enough since queue defaults are set in md_alloc()->blk_set_stacking_limits().
In case of we set "max_allocate_sectors = 0", in further it can be changed only manually,
but nobody does this.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

