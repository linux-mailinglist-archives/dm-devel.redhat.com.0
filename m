Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id CA587188DFF
	for <lists+dm-devel@lfdr.de>; Tue, 17 Mar 2020 20:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584473358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nlbXyZ8X2dzJ57Iw8wXrX8WSPz4na6g49go2X1alaVk=;
	b=Z3+s7AVyjA3vaSOk3c7yxzjVUE+prmjAPU5tYOTWwCW/xMLnHZ5wx4eP0j36WS1/o2+MJZ
	R6zPsfaJdcMfFsNcFPi/60hYWPARZ7SizkQMwK0OU4c1yePs/yDYK+xrFyaQm/zhFHEHcD
	j3p2AxaN1wua7uahFTmQ20kDoqB23ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-AuodN_oNMwalL_fePp0LkQ-1; Tue, 17 Mar 2020 15:29:16 -0400
X-MC-Unique: AuodN_oNMwalL_fePp0LkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237D0DBA7;
	Tue, 17 Mar 2020 19:29:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0882D5D9E5;
	Tue, 17 Mar 2020 19:29:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63926860FE;
	Tue, 17 Mar 2020 19:28:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HJShfg015481 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 15:28:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCAD719756; Tue, 17 Mar 2020 19:28:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CEC319C4F;
	Tue, 17 Mar 2020 19:28:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02HJSeW4026090; 
	Tue, 17 Mar 2020 14:28:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02HJSd15026089;
	Tue, 17 Mar 2020 14:28:39 -0500
Date: Tue, 17 Mar 2020 14:28:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200317192838.GW30153@octiron.msp.redhat.com>
References: <20200315210521.12109-1-mwilck@suse.com>
	<20200315210521.12109-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200315210521.12109-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 2/4] libmpathpersist:
 format_transportids(): avoid PROUT overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Mar 15, 2020 at 10:05:19PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This limits the PERSISTENT RESERVE OUT data size to max. 8192 bytes.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_pr_ioctl.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
> index 1a28cba7..c78e8000 100644
> --- a/libmpathpersist/mpath_pr_ioctl.c
> +++ b/libmpathpersist/mpath_pr_ioctl.c
> @@ -1,5 +1,6 @@
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <stddef.h>
>  
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -138,38 +139,64 @@ retry :
>  	return status;
>  }
>  
> +/*
> + * Helper macro to avoid overflow of prout_param_descriptor in
> + * format_transportids(). Data must not be written past
> + * MPATH_MAX_PARAM_LEN bytes from struct prout_param_descriptor.
> + */
> +#define check_overflow(ofs, n, start, label)				\
> +	do {								\
> +		if ((ofs) + (n) +					\
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

