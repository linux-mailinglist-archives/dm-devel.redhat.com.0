Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D62E7290D9B
	for <lists+dm-devel@lfdr.de>; Sat, 17 Oct 2020 00:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602886431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=seSFUk3GDOR4ZS55y/Mhz80t5Tb0wklsXDtIDyZiM+I=;
	b=T+5s3MkaUdb1vxEAneHtwie5WjAYyQRnA1xfvCzeI2lMWVF2bHHh2rUR1HodZmVYmo6BQB
	R5g71ducpU0mItjaRp+P4Y1R2MaeajrKZ1xzykWlCiqVLtNiA9x04aELd3MqTQ9/X/4njM
	6ks1phc1LvEGEEDPzKGuYIAJ1ZhRtI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-tGlIe7EbPL2NxgAnNqKxBg-1; Fri, 16 Oct 2020 18:13:49 -0400
X-MC-Unique: tGlIe7EbPL2NxgAnNqKxBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FEC71006704;
	Fri, 16 Oct 2020 22:13:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 520AA1002388;
	Fri, 16 Oct 2020 22:13:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32F501800B72;
	Fri, 16 Oct 2020 22:13:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GMDAwJ010473 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 18:13:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FF925D9D5; Fri, 16 Oct 2020 22:13:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD26A5D9CC;
	Fri, 16 Oct 2020 22:13:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09GMD5v5027416; 
	Fri, 16 Oct 2020 17:13:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09GMD4jE027415;
	Fri, 16 Oct 2020 17:13:04 -0500
Date: Fri, 16 Oct 2020 17:13:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201016221304.GX3384@octiron.msp.redhat.com>
References: <20201016104239.8217-1-mwilck@suse.com>
	<20201016104239.8217-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104239.8217-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 12/12] libmpathpersist: initialize
 mpp->hwe in get_mpvec()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:42:39PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> In __mpath_persistent_reserve_out, we call select_all_tg_pt(),
> which requires mpp->hwe to be set. Initialize it in get_mpvec().
> 
> Fixes: 5b54e77 ("mpathpersist: add all_tg_pt option")
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_persist.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> index 1f9817e..4b3f3e0 100644
> --- a/libmpathpersist/mpath_persist.c
> +++ b/libmpathpersist/mpath_persist.c
> @@ -341,11 +341,13 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
>  			continue;
>  
>  		if (update_multipath_table(mpp, pathvec, DI_CHECKER) != DMP_OK ||
> -		    update_multipath_status(mpp) != DMP_OK) {
> +		    update_multipath_status(mpp) != DMP_OK ||
> +		    update_mpp_paths(mpp, pathvec)) {
>  			condlog(1, "error parsing map %s", mpp->wwid);
>  			remove_map(mpp, pathvec, curmp, PURGE_VEC);
>  			i--;
> -		}
> +		} else
> +			extract_hwe_from_path(mpp);
>  	}
>  	return MPATH_PR_SUCCESS ;
>  }
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

