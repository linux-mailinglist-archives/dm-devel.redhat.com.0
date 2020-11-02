Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC29C2A2291
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 01:31:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-dZPaoRsbOTmCszZuE0Odog-1; Sun, 01 Nov 2020 19:31:49 -0500
X-MC-Unique: dZPaoRsbOTmCszZuE0Odog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3E831084C86;
	Mon,  2 Nov 2020 00:31:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5926E7514B;
	Mon,  2 Nov 2020 00:31:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75786180B657;
	Mon,  2 Nov 2020 00:31:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A20V4GR009743 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Nov 2020 19:31:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 640921111C7D; Mon,  2 Nov 2020 00:31:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EEE21111C7C
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 00:31:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F5A101AA4A
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 00:31:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-375-x3zbv_ZYNtKffuhqRVdHRw-1;
	Sun, 01 Nov 2020 19:30:59 -0500
X-MC-Unique: x3zbv_ZYNtKffuhqRVdHRw-1
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8E3CB2145D;
	Mon,  2 Nov 2020 00:30:57 +0000 (UTC)
Date: Sun, 1 Nov 2020 19:30:56 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20201102003056.GD2092@sasha-vm>
References: <20201026234905.1022767-1-sashal@kernel.org>
	<20201026234905.1022767-89-sashal@kernel.org>
	<20201027121959.GA13012@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027121959.GA13012@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [dm-devel] [PATCH AUTOSEL 5.9 089/147] dm: change max_io_len()
 to use blk_max_size_offset()
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
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Tue, Oct 27, 2020 at 08:19:59AM -0400, Mike Snitzer wrote:
>On Mon, Oct 26 2020 at  7:48pm -0400,
>Sasha Levin <sashal@kernel.org> wrote:
>
>> From: Mike Snitzer <snitzer@redhat.com>
>>
>> [ Upstream commit 5091cdec56faeaefa79de4b6cb3c3c55e50d1ac3 ]
>>
>> Using blk_max_size_offset() enables DM core's splitting to impose
>> ti->max_io_len (via q->limits.chunk_sectors) and also fallback to
>> respecting q->limits.max_sectors if chunk_sectors isn't set.
>>
>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Not sure why this commit elevated to stable@ picking it up, please
>explain.

I misread the series this patch was in as being a fix rather than only
the first patch, sorry :(

>But you cannot take this commit standalone. These commits are prereqs:
>
>22ada802ede8 block: use lcm_not_zero() when stacking chunk_sectors
>07d098e6bbad block: allow 'chunk_sectors' to be non-power-of-2
>882ec4e609c1 dm table: stack 'chunk_sectors' limit to account for target-specific splitting
>
>This goes for all stable@ trees you AUTOSEL'd commit 5091cdec56f for.
>
>Mike
>
>> ---
>>  drivers/md/dm.c | 20 ++++++++------------
>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>> index 6ed05ca65a0f8..3982012b1309c 100644
>> --- a/drivers/md/dm.c
>> +++ b/drivers/md/dm.c
>> @@ -1051,22 +1051,18 @@ static sector_t max_io_len_target_boundary(sector_t sector, struct dm_target *ti
>>  static sector_t max_io_len(sector_t sector, struct dm_target *ti)
>>  {
>>  	sector_t len = max_io_len_target_boundary(sector, ti);
>> -	sector_t offset, max_len;
>> +	sector_t max_len;
>>
>>  	/*
>>  	 * Does the target need to split even further?
>> +	 * - q->limits.chunk_sectors reflects ti->max_io_len so
>> +	 *   blk_max_size_offset() provides required splitting.
>> +	 * - blk_max_size_offset() also respects q->limits.max_sectors
>>  	 */
>> -	if (ti->max_io_len) {
>> -		offset = dm_target_offset(ti, sector);
>> -		if (unlikely(ti->max_io_len & (ti->max_io_len - 1)))
>> -			max_len = sector_div(offset, ti->max_io_len);
>> -		else
>> -			max_len = offset & (ti->max_io_len - 1);
>> -		max_len = ti->max_io_len - max_len;
>> -
>> -		if (len > max_len)
>> -			len = max_len;
>> -	}
>> +	max_len = blk_max_size_offset(dm_table_get_md(ti->table)->queue,
>> +				      dm_target_offset(ti, sector));
>> +	if (len > max_len)
>> +		len = max_len;
>>
>>  	return len;
>>  }
>> --
>> 2.25.1
>>
>

-- 
Thanks,
Sasha

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

