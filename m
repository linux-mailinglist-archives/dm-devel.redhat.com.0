Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 983AB2DCA75
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 02:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608168017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cu1EbvjthzSoHRW5lWHb8P9CIQOc2jdrSrKie8Cweu0=;
	b=PQFFYNd2cYwV7CC4E5IJcxve6H4uVoCZ3SJqF0rG5yeFmBiKZBQ9zD4r4jk7gZGGYTEpHH
	HRQq7HRG7mkAqusFfSPTJDnyW9mAVSgoLLesSvpMtMzpFLcfgWQ1HAmzipx5EviPfSzAfK
	NyfqqXQmmxekD2fENMDX+K07iPiWtjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-A14fdhXONA6VCSIy7GSBDw-1; Wed, 16 Dec 2020 20:20:15 -0500
X-MC-Unique: A14fdhXONA6VCSIy7GSBDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE7E8144E3;
	Thu, 17 Dec 2020 01:20:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A5718024;
	Thu, 17 Dec 2020 01:20:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09A554A7C6;
	Thu, 17 Dec 2020 01:19:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH1JmDV032731 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 20:19:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F5B217577; Thu, 17 Dec 2020 01:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6AB18796;
	Thu, 17 Dec 2020 01:19:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BH1JhOM027685; 
	Wed, 16 Dec 2020 19:19:43 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BH1JgeI027684;
	Wed, 16 Dec 2020 19:19:42 -0600
Date: Wed, 16 Dec 2020 19:19:42 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201217011942.GS3103@octiron.msp.redhat.com>
References: <20201216181708.22224-1-mwilck@suse.com>
	<20201216181708.22224-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201216181708.22224-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 02/29] multipathd: Fix liburcu memory leak
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 16, 2020 at 07:16:41PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Fix this leak in multipathd, reported by valgrind, that messes up
> multipathd's otherwise clean leak report:
> 
> ==23823== 336 bytes in 1 blocks are possibly lost in loss record 3 of 3
> ==23823==    at 0x483AB65: calloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==23823==    by 0x4012F16: _dl_allocate_tls (in /lib64/ld-2.31.so)
> ==23823==    by 0x493BB8E: pthread_create@@GLIBC_2.2.5 (in /lib64/libpthread-2.31.so)
> ==23823==    by 0x492A9A9: call_rcu_data_init (urcu-call-rcu-impl.h:437)
> ==23823==    by 0x492AD2F: UnknownInlinedFun (urcu-call-rcu-impl.h:492)
> ==23823==    by 0x492AD2F: create_call_rcu_data_memb (urcu-call-rcu-impl.h:504)
> ==23823==    by 0x1164E3: child.constprop.0.isra.0 (main.c:2915)
> ==23823==    by 0x10F50C: main (main.c:3335)
> ==23823==
> ==23823== LEAK SUMMARY:
> ==23823==    definitely lost: 0 bytes in 0 blocks
> ==23823==    indirectly lost: 0 bytes in 0 blocks
> ==23823==      possibly lost: 336 bytes in 1 blocks
> 
> The problem is caused by using liburcu's default RCU call handler,
> which liburcu refuses to stop/join. See comments in the code.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index c5c374b..ce14bb6 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2889,6 +2889,48 @@ set_oom_adj (void)
>  	condlog(0, "couldn't adjust oom score");
>  }
>  
> +/*
> + * Use a non-default call_rcu_data for child().
> + *
> + * We do this to avoid a memory leak from liburcu.
> + * liburcu never frees the default rcu handler (see comments on
> + * call_rcu_data_free() in urcu-call-rcu-impl.h), its thread
> + * can't be joined with pthread_join(), leaving a memory leak.
> + *
> + * Therefore we create our own, which can be destroyed and joined.
> + */
> +static struct call_rcu_data *setup_rcu(void)
> +{
> +	struct call_rcu_data *crdp;
> +
> +	rcu_init();
> +	rcu_register_thread();
> +	crdp = create_call_rcu_data(0UL, -1);
> +	if (crdp != NULL)
> +		set_thread_call_rcu_data(crdp);
> +	return crdp;
> +}
> +
> +static struct call_rcu_data *mp_rcu_data;
> +
> +static void cleanup_rcu(void)
> +{
> +	pthread_t rcu_thread;
> +
> +	/* Wait for any pending RCU calls */
> +	rcu_barrier();
> +	if (mp_rcu_data != NULL) {
> +		rcu_thread = get_call_rcu_thread(mp_rcu_data);
> +		/* detach this thread from the RCU thread */
> +		set_thread_call_rcu_data(NULL);
> +		synchronize_rcu();
> +		/* tell RCU thread to exit */
> +		call_rcu_data_free(mp_rcu_data);
> +		pthread_join(rcu_thread, NULL);
> +	}
> +	rcu_unregister_thread();
> +}
> +
>  static int
>  child (__attribute__((unused)) void *param)
>  {
> @@ -2906,7 +2948,8 @@ child (__attribute__((unused)) void *param)
>  
>  	mlockall(MCL_CURRENT | MCL_FUTURE);
>  	signal_init();
> -	rcu_init();
> +	mp_rcu_data = setup_rcu();
> +	atexit(cleanup_rcu);
>  
>  	setup_thread_attr(&misc_attr, 64 * 1024, 0);
>  	setup_thread_attr(&uevent_attr, DEFAULT_UEVENT_STACKSIZE * 1024, 0);
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

