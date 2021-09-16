Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCC6340D19F
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631758900;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Nx0B+9nvp+7oUFsgPo5sdef05SNHp9p8CIe5WFF8S0=;
	b=LthW7A4IsAhBCbdds5MkbJ116gvOShwKHhSqq88Ayc3IKEe+K1/Y7xu62uJovjkVnpu7Jr
	iuXHjMI4fRqwnb6bNGOtYoiGDuO4+wRj2MygEISPn7/kwnIbB7yD5MENDNXvQf25qeP7pf
	UCtMjLQog27SUSpNbhPjywLyyvl5/jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-2nnsyzHWOniCmAZc1AN8cg-1; Wed, 15 Sep 2021 22:21:39 -0400
X-MC-Unique: 2nnsyzHWOniCmAZc1AN8cg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A1171084689;
	Thu, 16 Sep 2021 02:21:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53D310016FF;
	Thu, 16 Sep 2021 02:21:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1776E1809C81;
	Thu, 16 Sep 2021 02:21:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2LU8d027976 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:21:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 037B818EC5; Thu, 16 Sep 2021 02:21:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 626DD781ED;
	Thu, 16 Sep 2021 02:21:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2LOSR007374; 
	Wed, 15 Sep 2021 21:21:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2LOpo007372;
	Wed, 15 Sep 2021 21:21:24 -0500
Date: Wed, 15 Sep 2021 21:21:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916022123.GH3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-23-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-23-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 22/35] multipathd: uxlsnr: remove
	check_timeout()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:07PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This function just prints a warning, anyway. If this warning
> is printed, the client will see a timeout and print a warning, too.
> A later patch will re-introduce this function with real functionality.
> 
The start_time variable should probably get remove from uxsock_listen
here instead of the next patch, but it doesn't actually hurt anything,
so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index cbbcb2c..147f81a 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -168,25 +168,6 @@ static void free_polls (void)
>  		FREE(polls);
>  }
>  
> -static void check_timeout(struct timespec start_time, char *inbuf,
> -		   unsigned int timeout)
> -{
> -	struct timespec diff_time, end_time;
> -
> -	if (start_time.tv_sec) {
> -		unsigned long msecs;
> -
> -		get_monotonic_time(&end_time);
> -		timespecsub(&end_time, &start_time, &diff_time);
> -		msecs = diff_time.tv_sec * 1000 +
> -			diff_time.tv_nsec / (1000 * 1000);
> -		if (msecs > timeout)
> -			condlog(2, "cli cmd '%s' timeout reached "
> -				"after %ld.%06lu secs", inbuf,
> -				(long)diff_time.tv_sec, diff_time.tv_nsec / 1000);
> -	}
> -}
> -
>  void uxsock_cleanup(void *arg)
>  {
>  	struct client *client_loop;
> @@ -574,8 +555,6 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
>  					FREE(reply);
>  					reply = NULL;
>  				}
> -				check_timeout(start_time, inbuf,
> -					      uxsock_timeout);
>  				FREE(inbuf);
>  			}
>  		}
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

