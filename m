Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1660338E125
	for <lists+dm-devel@lfdr.de>; Mon, 24 May 2021 08:47:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-pYrleyueOSOgato07nnj6Q-1; Mon, 24 May 2021 02:47:41 -0400
X-MC-Unique: pYrleyueOSOgato07nnj6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114451804688;
	Mon, 24 May 2021 06:47:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7575D9FC;
	Mon, 24 May 2021 06:47:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9F6A1800FFC;
	Mon, 24 May 2021 06:47:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14L9m3fD015314 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 05:48:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B10C100205D; Fri, 21 May 2021 09:48:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02FF71003200
	for <dm-devel@redhat.com>; Fri, 21 May 2021 09:48:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A712833959
	for <dm-devel@redhat.com>; Fri, 21 May 2021 09:48:00 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-66EMPf6TMs2f4fe3RsudBw-1; Fri, 21 May 2021 05:47:56 -0400
X-MC-Unique: 66EMPf6TMs2f4fe3RsudBw-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
	by youngberry.canonical.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lk1l2-0005Rc-FH; Fri, 21 May 2021 09:47:52 +0000
From: Colin Ian King <colin.king@canonical.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Joe Thornber <ejt@redhat.com>
References: <20210521094031.42356-1-colin.king@canonical.com>
Message-ID: <fe127847-f8ee-20aa-5613-19b8a110c712@canonical.com>
Date: Fri, 21 May 2021 10:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521094031.42356-1-colin.king@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 May 2021 02:47:09 -0400
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [dm-devel] NAK: [PATCH][next] dm space maps: Fix uninitialized
	variable r2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21/05/2021 10:40, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where recursing(mm) is true variable r2 is not
> inintialized and an uninitialized value is being used in the
> call combine_errors later on. Fix this by setting r2 to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: def6a7a9a7f0 ("dm space maps: improve performance with inc/dec on ranges of blocks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/md/persistent-data/dm-space-map-metadata.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/persistent-data/dm-space-map-metadata.c b/drivers/md/persistent-data/dm-space-map-metadata.c
> index 3b70ee861cf5..5be5ef4c831f 100644
> --- a/drivers/md/persistent-data/dm-space-map-metadata.c
> +++ b/drivers/md/persistent-data/dm-space-map-metadata.c
> @@ -432,9 +432,10 @@ static int sm_metadata_dec_blocks(struct dm_space_map *sm, dm_block_t b, dm_bloc
>  	int32_t nr_allocations;
>  	struct sm_metadata *smm = container_of(sm, struct sm_metadata, sm);
>  
> -	if (recursing(smm))
> +	if (recursing(smm)) {
>  		r = add_bop(smm, BOP_DEC, b, e);
> -	else {
> +		r2 = 0;
> +	} else {
>  		in(smm);
>  		r = sm_ll_dec(&smm->ll, b, e, &nr_allocations);
>  		r2 = out(smm);
> 

There is a another occurrence of this, I'll send a V2 shortly

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

