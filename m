Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4282B25B2
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 21:05:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36C0B308FE9A;
	Fri, 13 Sep 2019 19:05:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D285D9C3;
	Fri, 13 Sep 2019 19:05:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6335A180221D;
	Fri, 13 Sep 2019 19:05:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DJ0HID019931 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 15:00:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEE815D9E5; Fri, 13 Sep 2019 19:00:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18CEE5D9E1;
	Fri, 13 Sep 2019 19:00:12 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x8DJ0BRr013125; Fri, 13 Sep 2019 15:00:11 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x8DJ0BAB013121; Fri, 13 Sep 2019 15:00:11 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 13 Sep 2019 15:00:11 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190913160006.GA59158@lobo>
Message-ID: <alpine.LRH.2.02.1909131459400.12122@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190912084550.401229120@debian-a64.vm>
	<03876828-40a1-7adc-d40c-939853e8259c@redhat.com>
	<alpine.LRH.2.02.1909121206130.31437@file01.intranet.prod.int.rdu2.redhat.com>
	<20190913160006.GA59158@lobo>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, jiyong@google.com,
	kernel-team@android.com, Heinz Mauelshagen <heinzm@redhat.com>,
	dariofreni@google.com, dm-devel@redhat.com, maco@google.com,
	Martijn Coenen <maco@android.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 5/5] dm-bufio: introduce a global cache
	replacement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 13 Sep 2019 19:05:30 +0000 (UTC)



On Fri, 13 Sep 2019, Mike Snitzer wrote:

> On Thu, Sep 12 2019 at 12:07P -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > 
> > 
> > On Thu, 12 Sep 2019, Heinz Mauelshagen wrote:
> > 
> > > Mikulas,
> > > 
> > > please use list_move instead of list_del/list_add pairs.
> > > 
> > > Heinz
> > 
> > OK. Here I resend it.
> > 
> > 
> > 
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > This patch introduces a global cache replacement (instead of per-client
> > cleanup).
> > 
> > If one bufio client uses the cache heavily and another client is not using
> > it, we want to let the first client use most of the cache. The old
> > algorithm would partition the cache equally betwen the clients and that is
> > inoptimal.
> > 
> > For cache replacement, we use the clock algorithm because it doesn't
> > require taking any lock when the buffer is accessed.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> I'd like to fold in this cleanup if you're OK with it.
> 
> Rather use a main control structure for the loop rather than gotos.
> 
> You OK with this?

Yes - you can replace gotos with the loop.

Mikulas

> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index 8c6edec8a838..2d519c223562 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -230,7 +230,6 @@ static LIST_HEAD(dm_bufio_all_clients);
>   */
>  static DEFINE_MUTEX(dm_bufio_clients_lock);
>  
> -
>  static struct workqueue_struct *dm_bufio_wq;
>  static struct delayed_work dm_bufio_cleanup_old_work;
>  static struct work_struct dm_bufio_replacement_work;
> @@ -1827,62 +1826,60 @@ static void do_global_cleanup(struct work_struct *w)
>  	struct dm_bufio_client *current_client;
>  	struct dm_buffer *b;
>  	unsigned spinlock_hold_count;
> -	unsigned long threshold = dm_bufio_cache_size - dm_bufio_cache_size / DM_BUFIO_LOW_WATERMARK_RATIO;
> +	unsigned long threshold = dm_bufio_cache_size -
> +		dm_bufio_cache_size / DM_BUFIO_LOW_WATERMARK_RATIO;
>  	unsigned long loops = global_num * 2;
>  
>  	mutex_lock(&dm_bufio_clients_lock);
>  
> -reacquire_spinlock:
> -	cond_resched();
> +	while (1) {
> +		cond_resched();
>  
> -	spin_lock(&global_spinlock);
> -	if (unlikely(dm_bufio_current_allocated <= threshold))
> -		goto exit;
> +		spin_lock(&global_spinlock);
> +		if (unlikely(dm_bufio_current_allocated <= threshold))
> +			break;
>  
> -	spinlock_hold_count = 0;
> +		spinlock_hold_count = 0;
>  get_next:
> -	if (!loops--)
> -		goto exit;
> -	if (unlikely(list_empty(&global_queue)))
> -		goto exit;
> -	b = list_entry(global_queue.prev, struct dm_buffer, global_list);
> -
> -	if (b->accessed) {
> -		b->accessed = 0;
> -		list_move(&b->global_list, &global_queue);
> -		if (likely(++spinlock_hold_count < 16)) {
> -			goto get_next;
> -		}
> -		spin_unlock(&global_spinlock);
> -		goto reacquire_spinlock;
> -	}
> -
> -	current_client = b->c;
> -	if (unlikely(current_client != locked_client)) {
> -		if (locked_client)
> -			dm_bufio_unlock(locked_client);
> +		if (!loops--)
> +			break;
> +		if (unlikely(list_empty(&global_queue)))
> +			break;
> +		b = list_entry(global_queue.prev, struct dm_buffer, global_list);
>  
> -		if (!dm_bufio_trylock(current_client)) {
> +		if (b->accessed) {
> +			b->accessed = 0;
> +			list_move(&b->global_list, &global_queue);
> +			if (likely(++spinlock_hold_count < 16))
> +				goto get_next;
>  			spin_unlock(&global_spinlock);
> -			dm_bufio_lock(current_client);
> -			locked_client = current_client;
> -			goto reacquire_spinlock;
> +			continue;
>  		}
>  
> -		locked_client = current_client;
> -	}
> +		current_client = b->c;
> +		if (unlikely(current_client != locked_client)) {
> +			if (locked_client)
> +				dm_bufio_unlock(locked_client);
>  
> -	spin_unlock(&global_spinlock);
> +			if (!dm_bufio_trylock(current_client)) {
> +				spin_unlock(&global_spinlock);
> +				dm_bufio_lock(current_client);
> +				locked_client = current_client;
> +				continue;
> +			}
> +
> +			locked_client = current_client;
> +		}
>  
> -	if (unlikely(!__try_evict_buffer(b, GFP_KERNEL))) {
> -		spin_lock(&global_spinlock);
> -		list_move(&b->global_list, &global_queue);
>  		spin_unlock(&global_spinlock);
> -	}
>  
> -	goto reacquire_spinlock;
> +		if (unlikely(!__try_evict_buffer(b, GFP_KERNEL))) {
> +			spin_lock(&global_spinlock);
> +			list_move(&b->global_list, &global_queue);
> +			spin_unlock(&global_spinlock);
> +		}
> +	}
>  
> -exit:
>  	spin_unlock(&global_spinlock);
>  
>  	if (locked_client)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
