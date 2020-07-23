Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 401C522B06E
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 15:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595510624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W4FwAQvURU4I61KcGoRc8E2ct36BHjMUOAwblWXTleQ=;
	b=HJGRaUv3+BCMPPwpdGXENI5kzoJM38+hW3F3BdyhNMgBx5k894de9PjZfPAWediUBluuxB
	EkfzQTf+TiJC8LMQHa+2DGSGc+3/n3Jvm7CVug322uV6k4d8zZt9892+1SgWw3XnxoUm+G
	FrdIpEqZJCyd4utWuXpUNjkU2NbJsaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-hNQZ2tN7OKCwAKVYUIrOLA-1; Thu, 23 Jul 2020 09:23:41 -0400
X-MC-Unique: hNQZ2tN7OKCwAKVYUIrOLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B0CC80046C;
	Thu, 23 Jul 2020 13:23:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B888BEF3;
	Thu, 23 Jul 2020 13:23:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05386A3586;
	Thu, 23 Jul 2020 13:23:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NDMkc7028841 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 09:22:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C5AC2E029; Thu, 23 Jul 2020 13:22:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 178832DE9A;
	Thu, 23 Jul 2020 13:22:42 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06NDMeA0007395; 
	Thu, 23 Jul 2020 08:22:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06NDMdsP007394;
	Thu, 23 Jul 2020 08:22:39 -0500
Date: Thu, 23 Jul 2020 08:22:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200723132239.GL11089@octiron.msp.redhat.com>
References: <b1cccadd-955e-0341-879f-01659a04dbb4@huawei.com>
	<20200722205310.GK11089@octiron.msp.redhat.com>
	<fadebd49-d6b0-2813-68b0-57218f8fa13e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <fadebd49-d6b0-2813-68b0-57218f8fa13e@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: yanxiaodan@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>, mwilck@suse.com
Subject: Re: [dm-devel] [PATCH] libmultipath: free pp if store_path fails in
 disassemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 23, 2020 at 09:28:51AM +0800, Zhiqiang Liu wrote:
> 
> 
> On 2020/7/23 4:53, Benjamin Marzinski wrote:
> > On Wed, Jul 22, 2020 at 04:41:28PM +0800, Zhiqiang Liu wrote:
> >> In disassemble_map func, one pp will be allocated and stored in pathvec
> >> (only in client mode) and pgp->paths. However, if store_path fails, pp
> >> will not be freed, then memory leak problem occurs.
> >>
> >> Here, we will call free_path to free pp when store_path fails.
> >>
> > 
> > Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> > 
> > However, this will need to get reworked on top of Martin's patches (or
> > incorporated into his next verion patchset).
> > 
> 
> Thanks for your suggestion.
> Which branch should I choose to modify my patch?

Martin's latest set of commits is available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2007

> 
> 
> > -Ben
> > 
> >> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> >> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> >> ---
> >>  libmultipath/dmparser.c | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> >> index 6225838b..3dc77242 100644
> >> --- a/libmultipath/dmparser.c
> >> +++ b/libmultipath/dmparser.c
> >> @@ -142,6 +142,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
> >>  	int def_minio = 0;
> >>  	struct path * pp;
> >>  	struct pathgroup * pgp;
> >> +	int pp_need_free_flag = 0;
> >>
> >>  	p = params;
> >>
> >> @@ -293,6 +294,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
> >>  			char devname[FILE_NAME_SIZE];
> >>
> >>  			pp = NULL;
> >> +			pp_need_free_flag = 0;
> >>  			p += get_word(p, &word);
> >>
> >>  			if (!word)
> >> @@ -323,9 +325,15 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
> >>  					strncpy(pp->wwid, mpp->wwid,
> >>  						WWID_SIZE - 1);
> >>  				}
> >> +
> >> +				if (is_daemon)
> >> +					pp_need_free_flag = 1;
> >> +
> >>  				/* Only call this in multipath client mode */
> >> -				if (!is_daemon && store_path(pathvec, pp))
> >> +				if (!is_daemon && store_path(pathvec, pp)) {
> >> +					free_path(pp);
> >>  					goto out1;
> >> +				}
> >>  			} else {
> >>  				if (!strlen(pp->wwid) &&
> >>  				    strlen(mpp->wwid))
> >> @@ -334,8 +342,11 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
> >>  			}
> >>  			FREE(word);
> >>
> >> -			if (store_path(pgp->paths, pp))
> >> +			if (store_path(pgp->paths, pp)) {
> >> +				if (pp_need_free_flag)
> >> +					free_path(pp);
> >>  				goto out;
> >> +			}
> >>
> >>  			/*
> >>  			 * Update wwid for multipaths which are not setup
> >> -- 
> >> 2.24.0.windows.2
> >>
> > 
> > 
> > .
> > 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

