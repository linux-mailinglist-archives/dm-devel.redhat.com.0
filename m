Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B776FB23D2
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 18:06:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20B89308219E;
	Fri, 13 Sep 2019 16:06:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95CA9194B9;
	Fri, 13 Sep 2019 16:06:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B38F9180221D;
	Fri, 13 Sep 2019 16:06:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DG0EuW008414 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 12:00:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A0705DA8D; Fri, 13 Sep 2019 16:00:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BAD65D9CD;
	Fri, 13 Sep 2019 16:00:11 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99B0930860CB;
	Fri, 13 Sep 2019 16:00:09 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y144so20608012qkb.7;
	Fri, 13 Sep 2019 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vzFH4j4q3YMrEpL/cQj4ozdunPcbeuloDdvzHOPqU+M=;
	b=J0DwkFpjrDxipzihDx5yud4w1Sux7bGssB6cepspYVURONhXk7jVnxdMCmxVD9DNR5
	NU/k2ZtBNB2jpcK4FJuPK7fofTuMr/OLXfwQKMsT/fia+faZLN7o9aAU+uRC7XkMT2XS
	VoaNZvvFbsFlitc92ThwGsrrM+R3JUM0xP9Mx9zJVZW6YTU+ijCNzosH1si/k0S3P53N
	uJB1+hckkvIQvOPsh2iFRwAbWEtnpni/h9BM/XoEGkawISarS7gcte3Smnmd/fEFKHkp
	lP7Chwc7DQPD3RZPFI+QZ8AZnMkBS/0xd6ja+LUcbxmBEKZVDqarM9uqcmlXFkkXEbyn
	5Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vzFH4j4q3YMrEpL/cQj4ozdunPcbeuloDdvzHOPqU+M=;
	b=aNCjA+SO270SU7+ipvRqHEjQwpmav/rRYTKBcbOerAoCETcqsBiFEX8rYQAepH8wKa
	9aptW6TIundYJ9WufQn6dBVrmzM5k6IePwdEEKB5QbQEoyhktS1pmeAQ7CClCOy+eYf+
	mj3KWNiqDO4U2+G0+EEOjTA37JXVxxmld+5qEm7ma+7jEHbOkdocBhLFhRvyNg0Aps4z
	cZKqdy/RZLAoLEzwCKOCfMKk/2NuaQRcUHShrTurGnRb6eyNyJAeBqUfa0YKRlytMGdC
	kOAMZsO09DqJ5A4DYybNk9h/jhPy0hZ+q4HsRKwEYB9R4LByLvLjjFroDHD1IO1as2Od
	v9IA==
X-Gm-Message-State: APjAAAXvCT84fYI9k/4Nq6zX16jgg9GHdAzTAFtonVjzanJd9GBWdX5b
	PWfHFmiPQ4zjueSVS2oc+tgi0FHRvbI=
X-Google-Smtp-Source: APXvYqzxfsWlmXVz0yEEY6pgXlz3y/pp6KxcF4ebpaeHRqpp3a3Zaw0afNEhapMvMbPzpqNGQzs4rg==
X-Received: by 2002:a05:620a:1006:: with SMTP id
	z6mr3318136qkj.319.1568390408269; 
	Fri, 13 Sep 2019 09:00:08 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	s1sm12472287qkj.125.2019.09.13.09.00.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Sep 2019 09:00:07 -0700 (PDT)
Date: Fri, 13 Sep 2019 12:00:06 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190913160006.GA59158@lobo>
References: <20190912084550.401229120@debian-a64.vm>
	<03876828-40a1-7adc-d40c-939853e8259c@redhat.com>
	<alpine.LRH.2.02.1909121206130.31437@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1909121206130.31437@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 13 Sep 2019 16:00:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 13 Sep 2019 16:00:09 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.195 mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 13 Sep 2019 16:06:38 +0000 (UTC)

On Thu, Sep 12 2019 at 12:07P -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Thu, 12 Sep 2019, Heinz Mauelshagen wrote:
> 
> > Mikulas,
> > 
> > please use list_move instead of list_del/list_add pairs.
> > 
> > Heinz
> 
> OK. Here I resend it.
> 
> 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> This patch introduces a global cache replacement (instead of per-client
> cleanup).
> 
> If one bufio client uses the cache heavily and another client is not using
> it, we want to let the first client use most of the cache. The old
> algorithm would partition the cache equally betwen the clients and that is
> inoptimal.
> 
> For cache replacement, we use the clock algorithm because it doesn't
> require taking any lock when the buffer is accessed.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

I'd like to fold in this cleanup if you're OK with it.

Rather use a main control structure for the loop rather than gotos.

You OK with this?

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 8c6edec8a838..2d519c223562 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -230,7 +230,6 @@ static LIST_HEAD(dm_bufio_all_clients);
  */
 static DEFINE_MUTEX(dm_bufio_clients_lock);
 
-
 static struct workqueue_struct *dm_bufio_wq;
 static struct delayed_work dm_bufio_cleanup_old_work;
 static struct work_struct dm_bufio_replacement_work;
@@ -1827,62 +1826,60 @@ static void do_global_cleanup(struct work_struct *w)
 	struct dm_bufio_client *current_client;
 	struct dm_buffer *b;
 	unsigned spinlock_hold_count;
-	unsigned long threshold = dm_bufio_cache_size - dm_bufio_cache_size / DM_BUFIO_LOW_WATERMARK_RATIO;
+	unsigned long threshold = dm_bufio_cache_size -
+		dm_bufio_cache_size / DM_BUFIO_LOW_WATERMARK_RATIO;
 	unsigned long loops = global_num * 2;
 
 	mutex_lock(&dm_bufio_clients_lock);
 
-reacquire_spinlock:
-	cond_resched();
+	while (1) {
+		cond_resched();
 
-	spin_lock(&global_spinlock);
-	if (unlikely(dm_bufio_current_allocated <= threshold))
-		goto exit;
+		spin_lock(&global_spinlock);
+		if (unlikely(dm_bufio_current_allocated <= threshold))
+			break;
 
-	spinlock_hold_count = 0;
+		spinlock_hold_count = 0;
 get_next:
-	if (!loops--)
-		goto exit;
-	if (unlikely(list_empty(&global_queue)))
-		goto exit;
-	b = list_entry(global_queue.prev, struct dm_buffer, global_list);
-
-	if (b->accessed) {
-		b->accessed = 0;
-		list_move(&b->global_list, &global_queue);
-		if (likely(++spinlock_hold_count < 16)) {
-			goto get_next;
-		}
-		spin_unlock(&global_spinlock);
-		goto reacquire_spinlock;
-	}
-
-	current_client = b->c;
-	if (unlikely(current_client != locked_client)) {
-		if (locked_client)
-			dm_bufio_unlock(locked_client);
+		if (!loops--)
+			break;
+		if (unlikely(list_empty(&global_queue)))
+			break;
+		b = list_entry(global_queue.prev, struct dm_buffer, global_list);
 
-		if (!dm_bufio_trylock(current_client)) {
+		if (b->accessed) {
+			b->accessed = 0;
+			list_move(&b->global_list, &global_queue);
+			if (likely(++spinlock_hold_count < 16))
+				goto get_next;
 			spin_unlock(&global_spinlock);
-			dm_bufio_lock(current_client);
-			locked_client = current_client;
-			goto reacquire_spinlock;
+			continue;
 		}
 
-		locked_client = current_client;
-	}
+		current_client = b->c;
+		if (unlikely(current_client != locked_client)) {
+			if (locked_client)
+				dm_bufio_unlock(locked_client);
 
-	spin_unlock(&global_spinlock);
+			if (!dm_bufio_trylock(current_client)) {
+				spin_unlock(&global_spinlock);
+				dm_bufio_lock(current_client);
+				locked_client = current_client;
+				continue;
+			}
+
+			locked_client = current_client;
+		}
 
-	if (unlikely(!__try_evict_buffer(b, GFP_KERNEL))) {
-		spin_lock(&global_spinlock);
-		list_move(&b->global_list, &global_queue);
 		spin_unlock(&global_spinlock);
-	}
 
-	goto reacquire_spinlock;
+		if (unlikely(!__try_evict_buffer(b, GFP_KERNEL))) {
+			spin_lock(&global_spinlock);
+			list_move(&b->global_list, &global_queue);
+			spin_unlock(&global_spinlock);
+		}
+	}
 
-exit:
 	spin_unlock(&global_spinlock);
 
 	if (locked_client)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
