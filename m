Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A364A1856A2
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 01:20:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584231612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rcNmnIfifOg4TKQaN4FB68vmBMxlW5t/k4pBEV6oglM=;
	b=QkfVbQXr6xRZyFfbFMY5Zgy8juc50AUMl6S1Rw5R/+hiRwzU3S8BQqNdauOL4o0agwQYnD
	SOAeyekJaTJO42vPe6TA+7KQGe+Xvw6ccLMSB9iCPn56qE/UanACYhdRuWpz75300CyJM/
	vxstRE160Jrv4X8J/Ga9qooppk7ugrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-OEyZ1bLDNJeuE0bttbq0cw-1; Sat, 14 Mar 2020 20:20:10 -0400
X-MC-Unique: OEyZ1bLDNJeuE0bttbq0cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD0A800D53;
	Sun, 15 Mar 2020 00:20:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A5419C69;
	Sun, 15 Mar 2020 00:19:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77E3D18089CD;
	Sun, 15 Mar 2020 00:19:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02F0JeI1017017 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 20:19:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACE1660304; Sun, 15 Mar 2020 00:19:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 972158D573;
	Sun, 15 Mar 2020 00:19:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02F0JaTu028277; 
	Sat, 14 Mar 2020 19:19:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02F0Ja24028276;
	Sat, 14 Mar 2020 19:19:36 -0500
Date: Sat, 14 Mar 2020 19:19:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200315001935.GU30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200306230605.3473-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmpathpersist: ABI change: limit
 data-in/out size to 8192 bytes
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
Content-Disposition: inline

On Sat, Mar 07, 2020 at 12:06:05AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Make sure that data structures used for PERSISTENT RESERVE IN/OUT
> fit into 8k buffers.
> 
> This patch breaks the libmpathpersist ABI.
>

I'm not super worried about this.  I don't really see a way for users to
hurt themselves because of this change, without making some pretty odd
assumptions.  Am I missing something?

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_persist.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
> index 7cf4faf9..bdf4069d 100644
> --- a/libmpathpersist/mpath_persist.h
> +++ b/libmpathpersist/mpath_persist.h
> @@ -92,7 +92,7 @@ struct prin_readdescr
>  	uint32_t prgeneration;
>  	uint32_t additional_length;	/* The value should be either 0 or divisible by 8.
>  					   0 indicates no registered reservation key. */
> -	uint8_t	 key_list[MPATH_MAX_PARAM_LEN];
> +	uint8_t	 key_list[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
>  };
>  
>  struct prin_resvdescr
> @@ -141,7 +141,9 @@ struct print_fulldescr_list
>  {
>  	uint32_t prgeneration;
>  	uint32_t number_of_descriptor;
> -	uint8_t private_buffer[MPATH_MAX_PARAM_LEN]; /*Private buffer for list storage*/
> +	/* Data-in; Private buffer for list storage */
> +	uint8_t private_buffer[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
> +	/* array of pointers into private_buffer */
>  	struct prin_fulldescr *descriptors[];
>  };
>  
> @@ -163,8 +165,13 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
>  	uint8_t	 sa_flags;
>  	uint8_t _reserved;
>  	uint16_t _obsolete1;
> -	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN]; /*private buffer for list storage*/
> -	uint32_t num_transportid;	/* Number of Transport ID listed in trnptid_list[]*/
> +	/*private buffer for list storage; data-out */
> +	/* 24: offsetof (struct prout_param_descriptor, private_buffer) */
> +	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN - 24];
> +	/* Internal use below here */
> +	/* Number of Transport ID listed in trnptid_list[] */
> +	uint32_t num_transportid;
> +	/* pointers into private_buffer */
>  	struct transportid *trnptid_list[];
>  };
>  
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

