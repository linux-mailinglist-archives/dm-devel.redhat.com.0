Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51CAF40D253
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 06:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631766194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CPHedjWZom4fVH/AvWx3/kzNgpHmSky15EA7QQ/pQ3w=;
	b=AZiPfSXT0wdWq+vGUpSI2qUhUi2pCKC/VlWlwIjU1US4lWeI02OB3bBiVU63tMgNb/OAhC
	9VJkUixgDG81botDOyWYeV+8lBWNDCdHVOVmERgQWOJgvUkJeHHQDepMyULuE6dcwxhyM8
	GU8aUSAwV3NEzK5IYN4L0PKCqnSYcow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-KdWXEsuWPRC_TJTs2L5JHA-1; Thu, 16 Sep 2021 00:23:12 -0400
X-MC-Unique: KdWXEsuWPRC_TJTs2L5JHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACEBC1084683;
	Thu, 16 Sep 2021 04:23:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8844C104B4C2;
	Thu, 16 Sep 2021 04:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D91154EA29;
	Thu, 16 Sep 2021 04:23:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G4MxOV004853 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 00:22:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7F1E5D9D3; Thu, 16 Sep 2021 04:22:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FC75D9CA;
	Thu, 16 Sep 2021 04:22:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G4MrUV007918; 
	Wed, 15 Sep 2021 23:22:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G4MrYl007917;
	Wed, 15 Sep 2021 23:22:53 -0500
Date: Wed, 15 Sep 2021 23:22:53 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916042253.GS3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-34-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-34-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 33/35] multipathd: uxlsnr: use poll loop for
	sending, too
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

On Fri, Sep 10, 2021 at 01:41:18PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> send_packet() may busy-loop. By polling for POLLOUT, we can
> avoid that, even if it's very unlikely in practice.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 1bf4126..c18b2c4 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -588,15 +588,37 @@ static void handle_client(struct client *c, struct vectors *vecs, short revents)
>  		if (get_strbuf_len(&c->reply) == 0)
>  			default_reply(c, c->error);
>  
> -		const char *buf = get_strbuf_str(&c->reply);
> +		if (c->cmd_len == 0) {
> +			size_t len = get_strbuf_len(&c->reply) + 1;
>  
> -		if (send_packet(c->fd, buf) != 0)
> -			dead_client(c);
> -		else
> -			condlog(4, "cli[%d]: Reply [%zu bytes]", c->fd,
> -				get_strbuf_len(&c->reply) + 1);
> -		reset_strbuf(&c->reply);
> +			if (send(c->fd, &len, sizeof(len), MSG_NOSIGNAL)
> +			    != sizeof(len)) {

This assumes that failing to send the size is always an error. What
about if we get EINTR/EAGAIN? Also, it seems pretty likely that we will
either send all of the size or none of it, but I'm not sure we can
guarantee that.  send_packet() handled partitial writes of the length.
Actually, mpath_recv_reply_len() which is still used by CLT_RECV still
uses read_all(), instead of just polling again on partial reads.

Also, the fd is not set to be non-blocking. and if we fall through to
CLT_SEND, we haven't checked for a POLLOUT revent, so technically, I
believe the write could block here.

-Ben

> +				c->error = -ECONNRESET;
> +				return;
> +			}
> +			c->cmd_len = len;
> +			return;
> +		}
>  
> +		if (c->len < c->cmd_len) {
> +			const char *buf = get_strbuf_str(&c->reply);
> +
> +			n = send(c->fd, buf + c->len, c->cmd_len, MSG_NOSIGNAL);
> +			if (n == -1) {
> +				if (errno == EAGAIN || errno == EINTR)
> +					return;
> +				else {
> +					c->error = -ECONNRESET;
> +					return;
> +				}
> +			}
> +			c->len += n;
> +		}
> +		if (c->len < c->cmd_len)
> +			/* continue polling */
> +			return;
> +
> +		condlog(4, "cli[%d]: Reply [%zu bytes]", c->fd, c->cmd_len);
>  		set_client_state(c, CLT_RECV);
>  		break;
>  
> @@ -701,6 +723,9 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
>                          case CLT_RECV:
>                                  polls[i].events = POLLIN;
>                                  break;
> +			case CLT_SEND:
> +				polls[i].events = POLLOUT;
> +				break;
>                          default:
>  				/* don't poll for this client */
>                                  continue;
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

