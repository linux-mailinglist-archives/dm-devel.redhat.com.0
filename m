Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF44D185690
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 00:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584227761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z3U2Zt5IwHWGElOabMgI1aiRaPb2C0Z7RbxLf1wJMGw=;
	b=OIM69az6T20oyZX8phXBAVkWRVMpC8lWXw/e8F5WeQREj4tkndE3k80smsfbFC138U/HuT
	hZdeOoisnoyL+FXR24bXhEYMZkblCiD/pRmBQQBbfAQqeIrLxxDaqZf7ir4FSwt6COfAMN
	X/SQQpshIjgKJ55FEpFxx+wpMOulpDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-IkHuklN9PG2A96zK2L790A-1; Sat, 14 Mar 2020 19:15:58 -0400
X-MC-Unique: IkHuklN9PG2A96zK2L790A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1964C6124F;
	Sat, 14 Mar 2020 23:15:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 966E27386E;
	Sat, 14 Mar 2020 23:15:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6485718089CD;
	Sat, 14 Mar 2020 23:15:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ENFheH015680 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 19:15:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD94592D0C; Sat, 14 Mar 2020 23:15:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E337673888;
	Sat, 14 Mar 2020 23:15:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02ENFdOm027720; 
	Sat, 14 Mar 2020 18:15:39 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02ENFdpE027719;
	Sat, 14 Mar 2020 18:15:39 -0500
Date: Sat, 14 Mar 2020 18:15:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200314231539.GS30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200306230605.3473-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 2/4] libmpathpersist: format_transportids():
 avoid PROUT overflow
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Mar 07, 2020 at 12:06:03AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This limits the PERSISTENT RESERVE OUT data size to max. 8192 bytes.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_pr_ioctl.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
> index 1a28cba7..8bf16c0d 100644
> --- a/libmpathpersist/mpath_pr_ioctl.c
> +++ b/libmpathpersist/mpath_pr_ioctl.c
> @@ -1,5 +1,6 @@
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <stddef.h>
>  
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -138,38 +139,59 @@ retry :
>  	return status;
>  }
>  
> +#define check_overflow(ofs, n, start, label)				\
> +	do {								\
> +		if ((ofs) + 4 + (n) +					\

I don't get where the 4 comes from here, since buff_offset starts
at 4. Maybe I'm just missing something.

-Ben

> +		    offsetof(struct prout_param_descriptor, private_buffer) \
> +		    > MPATH_MAX_PARAM_LEN)				\
> +		{							\
> +			(ofs) = (start);				\
> +			goto label;					\
> +		}							\
> +	} while(0)
> +
>  uint32_t  format_transportids(struct prout_param_descriptor *paramp)
>  {
>  	unsigned int i = 0, len;
>  	uint32_t buff_offset = 4;
> -	memset(paramp->private_buffer, 0, MPATH_MAX_PARAM_LEN);
> +	memset(paramp->private_buffer, 0, sizeof(paramp->private_buffer));
>  	for (i=0; i < paramp->num_transportid; i++ )
>  	{
> +		uint32_t start_offset = buff_offset;
> +
> +		check_overflow(buff_offset, 1, start_offset, end_loop);
>  		paramp->private_buffer[buff_offset] = (uint8_t)((paramp->trnptid_list[i]->format_code & 0xff)|
>  							(paramp->trnptid_list[i]->protocol_id & 0xff));
>  		buff_offset += 1;
>  		switch(paramp->trnptid_list[i]->protocol_id)
>  		{
>  			case MPATH_PROTOCOL_ID_FC:
> +				check_overflow(buff_offset, 7 + 8 + 8,
> +					       start_offset, end_loop);
>  				buff_offset += 7;
>  				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->n_port_name, 8);
>  				buff_offset +=8 ;
>  				buff_offset +=8 ;
>  				break;
>  			case MPATH_PROTOCOL_ID_SAS:
> +				check_overflow(buff_offset, 3 + 12,
> +					       start_offset, end_loop);
>  				buff_offset += 3;
>  				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->sas_address, 8);
>  				buff_offset += 12;
>  				break;
>  			case MPATH_PROTOCOL_ID_ISCSI:
> -				buff_offset += 1;
>  				len = (paramp->trnptid_list[i]->iscsi_name[1] & 0xff)+2;
> +				check_overflow(buff_offset, 1 + len,
> +					       start_offset, end_loop);
> +				buff_offset += 1;
>  				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->iscsi_name,len);
>  				buff_offset += len ;
>  				break;
>  		}
>  
>  	}
> +end_loop:
>  	buff_offset -= 4;
>  	paramp->private_buffer[0] = (unsigned char)((buff_offset >> 24) & 0xff);
>  	paramp->private_buffer[1] = (unsigned char)((buff_offset >> 16) & 0xff);
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

