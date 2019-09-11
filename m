Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DCB0455
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 21:00:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BCE780038D;
	Wed, 11 Sep 2019 19:00:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6927060C18;
	Wed, 11 Sep 2019 19:00:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45BE42551C;
	Wed, 11 Sep 2019 19:00:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BIxduM021867 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 14:59:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB73419C78; Wed, 11 Sep 2019 18:59:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E8B19C6A;
	Wed, 11 Sep 2019 18:59:31 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06F8A4ACA5;
	Wed, 11 Sep 2019 18:59:30 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id A4F161E275;
	Wed, 11 Sep 2019 14:59:28 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 36B8CA5B0D; Wed, 11 Sep 2019 14:59:28 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <23929.17424.161332.501830@quad.stoffel.home>
Date: Wed, 11 Sep 2019 14:59:28 -0400
From: "John Stoffel" <john@stoffel.org>
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190911133523.GA32121@redhat.com>
References: <20190911113133.837-1-ming.lei@redhat.com>
	<20190911133523.GA32121@redhat.com>
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Wed, 11 Sep 2019 18:59:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Wed, 11 Sep 2019 18:59:30 +0000 (UTC) for IP:'172.104.24.175'
	DOMAIN:'li1843-175.members.linode.com' HELO:'mail.stoffel.org'
	FROM:'john@stoffel.org' RCPT:''
X-RedHat-Spam-Score: -0.002  (SPF_HELO_PASS,
	SPF_PASS) 172.104.24.175 li1843-175.members.linode.com
	172.104.24.175 li1843-175.members.linode.com <john@stoffel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH V2] dm-raid: fix updating
	of	max_discard_sectors limit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 11 Sep 2019 19:00:12 +0000 (UTC)

>>>>> "Mike" == Mike Snitzer <snitzer@redhat.com> writes:

Mike> On Wed, Sep 11 2019 at  7:31am -0400,
Mike> Ming Lei <ming.lei@redhat.com> wrote:

>> Unit of 'chunk_size' is byte, instead of sector, so fix it.
>> 
>> Without this fix, too big max_discard_sectors is applied on the request queue
>> of dm-raid, finally raid code has to split the bio again.
>> 
>> This re-split done by raid causes the following nested clone_endio:
>> 
>> 1) one big bio 'A' is submitted to dm queue, and served as the original
>> bio
>> 
>> 2) one new bio 'B' is cloned from the original bio 'A', and .map()
>> is run on this bio of 'B', and B's original bio points to 'A'
>> 
>> 3) raid code sees that 'B' is too big, and split 'B' and re-submit
>> the remainded part of 'B' to dm-raid queue via generic_make_request().
>> 
>> 4) now dm will hanlde 'B' as new original bio, then allocate a new
>> clone bio of 'C' and run .map() on 'C'. Meantime C's original bio
>> points to 'B'.
>> 
>> 5) suppose now 'C' is completed by raid direclty, then the following
>> clone_endio() is called recursively:
>> 
>> clone_endio(C)
-> clone_endio(B)		#B is original bio of 'C'
-> bio_endio(A)
>> 
>> 'A' can be big enough to make handreds of nested clone_endio(), then
>> stack can be corrupted easily.
>> 
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Ming Lei <ming.lei@redhat.com>
>> ---
>> V2:
>> - fix commit log a bit
>> 
>> drivers/md/dm-raid.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
>> index 8a60a4a070ac..c26aa4e8207a 100644
>> --- a/drivers/md/dm-raid.c
>> +++ b/drivers/md/dm-raid.c
>> @@ -3749,7 +3749,7 @@ static void raid_io_hints(struct dm_target *ti, struct queue_limits *limits)
>> */
>> if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
limits-> discard_granularity = chunk_size;
>> -		limits->max_discard_sectors = chunk_size;
>> +		limits->max_discard_sectors = chunk_size >> 9;
>> }
>> }
>> 
>> -- 
>> 2.20.1
>> 

Mike> Thanks a lot Ming!  But oof, really embarassing oversight on my part!

Mike> FYI, I added a "Fixes:" tag to the commit header and switched to
Mike> shifting by SECTOR_SHIFT instead of 9, staged commit for 5.4 is here:

Mike> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=509818079bf1fefff4ed02d6a1b994e20efc0480

Mike> --
Mike> dm-devel mailing list
Mike> dm-devel@redhat.com
Mike> https://www.redhat.com/mailman/listinfo/dm-devel



Would it make sense to re-name the variable to chunk_size_bytes as
well?  

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
