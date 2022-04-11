Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 067034FB13F
	for <lists+dm-devel@lfdr.de>; Mon, 11 Apr 2022 03:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649639116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=egXi62D/mwY2K81bfrE4hmw7ZFye1qb3bO9AZb3T30g=;
	b=LYn9HmgYPzaAGPPpU6HaEA3fSGtdHr959B6GoCdorO404BFYpfX8GZ+7zgu+5qrH0j7piz
	AGs59popFO6o/wZh/iLgkfHp2E/rpOW7+v5qDkMJ3MKo4+6lVR4Z3ZROUcKTZPi8xl09w9
	ZSsm69bnqtrkYWGbNSzo4Yp/xd8fTcw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-RqzR7ZUCMG-cj1SOpDm_wQ-1; Sun, 10 Apr 2022 21:05:14 -0400
X-MC-Unique: RqzR7ZUCMG-cj1SOpDm_wQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 986F729DD996;
	Mon, 11 Apr 2022 01:05:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57077403374;
	Mon, 11 Apr 2022 01:05:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 952BF1940365;
	Mon, 11 Apr 2022 01:05:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 344F619466DF
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Apr 2022 01:05:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 247F42166BB1; Mon, 11 Apr 2022 01:05:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A91E52166BA9;
 Mon, 11 Apr 2022 01:04:43 +0000 (UTC)
Date: Mon, 11 Apr 2022 09:04:38 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YlN+plgvwZQdPBGj@T590>
References: <20220408171254.935171-1-ming.lei@redhat.com>
 <20220408171254.935171-2-ming.lei@redhat.com>
 <8b9078c2-7884-a5b5-5aa9-ad284b4068ef@opensource.wdc.com>
 <YlN4BC2qbGODxbVz@T590>
 <95d8a8ed-27f8-0d88-a543-16910dca83e3@opensource.wdc.com>
MIME-Version: 1.0
In-Reply-To: <95d8a8ed-27f8-0d88-a543-16910dca83e3@opensource.wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH 1/3] dm: don't grab target io reference in
 dm_zone_map_bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
 Mike Snitzer <snitzer@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 11, 2022 at 09:50:57AM +0900, Damien Le Moal wrote:
> On 4/11/22 09:36, Ming Lei wrote:
> > On Mon, Apr 11, 2022 at 09:18:56AM +0900, Damien Le Moal wrote:
> >> On 4/9/22 02:12, Ming Lei wrote:
> >>> dm_zone_map_bio() is only called from __map_bio in which the io's
> >>> reference is grabbed already, and the reference won't be released
> >>> until the bio is submitted, so no necessary to do it dm_zone_map_bio
> >>> any more.
> >>
> >> I do not think that this patch is correct. Removing the extra reference on
> >> the io can lead to problems if the io is completed in the target
> >> ->map(ti, clone) call or before dm_zone_map_bio_end() is called for the
> >> DM_MAPIO_SUBMITTED or DM_MAPIO_REMAPPED cases. dm_zone_map_bio_end() needs
> > 
> > __map_bio():
> > 	...
> > 	dm_io_inc_pending(io);
> > 	...
> > 	dm_zone_map_bio(tio);
> > 	...
> 
> dm-crypt (for instance) may terminate the clone bio immediately in its
> ->map() function context, resulting in the bio_endio()clone) ->
> clone_endio() -> dm_io_dec_pending() call chain.
> 
> With that, the io is gone and dm_zone_map_bio_end() will not have a valid
> reference on the orig bio.

Any target can complete io during ->map. Here looks nothing is special with
dm-crypt or dm-zone, why does only dm zone need extra reference?

The reference counter is initialized as 1 in init_clone_info(), dm_io_inc_pending()
in __map_bio() increases it to 2, so after the above call chain you mentioned is done,
the counter becomes 1. The original bio can't be completed until dm_io_dec_pending()
in dm_split_and_process_bio() is called.

Or maybe I miss any extra requirement from dm-zone?


thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

