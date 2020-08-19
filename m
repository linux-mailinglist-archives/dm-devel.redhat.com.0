Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 398B6249838
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 10:27:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-chDwL1imMDeWN5Mx2LeM8A-1; Wed, 19 Aug 2020 04:27:09 -0400
X-MC-Unique: chDwL1imMDeWN5Mx2LeM8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848DE807330;
	Wed, 19 Aug 2020 08:26:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9418B5C1DC;
	Wed, 19 Aug 2020 08:26:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 521BA180B656;
	Wed, 19 Aug 2020 08:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J8QNCM015821 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 04:26:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3602B110F0A6; Wed, 19 Aug 2020 08:26:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31876110F0A0
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:26:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A21468785C7
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:26:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-59-k9l6Kdk8PxCCIUj0zdGFPw-1;
	Wed, 19 Aug 2020 04:26:18 -0400
X-MC-Unique: k9l6Kdk8PxCCIUj0zdGFPw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8794FAEBA;
	Wed, 19 Aug 2020 08:26:42 +0000 (UTC)
Message-ID: <d76537854b7e9171738cf8db094319088bb13c3a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Aug 2020 10:26:15 +0200
In-Reply-To: <e15fee1e-145b-2880-c84a-aba7b1496555@huawei.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<e15fee1e-145b-2880-c84a-aba7b1496555@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel mailing list <dm-devel@redhat.com>,
	liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath fix daemon memory leak in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello lixiaokeng,

Thanks again for your contribution.

On Wed, 2020-08-19 at 09:50 +0800, lixiaokeng wrote:
> 
> If checking is_deamon is deleted, there are many other things need be
> done like in
> https://www.redhat.com/archives/dm-devel/2020-July/msg00245.html. And
> this
> branch develops from 0.8.3 but upstream_queue is mainline which
> develops from
> 0.8.4.

This is a misunderstanding. My upstream-queue branch is *not* mainline.
Mainline is http://git.opensvc.com/multipath-tools/.git. Also, my
entire patch series (link above) was based on upstream-queue, which in
turn was based on 0.8.4, not 0.8.3.

As the name says, "upstream-queue" represents the queue of pending
patches which have at least one positive review (and no negative ones).
The intention is 1. to provide an overview for myself and other
interested parties, and 2. to simplify matters for the actual
maintainer, Christophe, when he applies patches onto mainline.

My patch series changes the same code path as this one, and I think it
solves the same issue, albeit differently. Most of my series has
meanwhile been positively reviewed by Ben, and the remaining open
issues are in other parts of the series. I'll hopefully be able to push
it to upstream-queue soon. IMO it makes little sense to push changes to
upstream-queue which are going to be removed again when my series is
applied (I don't intend to start using merge operations in this
branch).

Christophe is on the recipients list of your patch. He may of course
decide to apply your patch before my series, in which case I'll have to
rebase mine. But he'll probably have other prior patches to look at
first before he gets down to this one.

Regards,
Martin

> Here, we skip alloc_path if pp isn't find in pathvec and process is
> daemon.  In
> daemon, we should not store path with incomplete information to
> pathvec.  The
> pathvec stores all paths in daemon, so it is reasonable keep same
> with pathvec.
> 
> Reported-by: Tianxiong Li <lutianxiong@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  libmultipath/dmparser.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index f02c551..0f370e9 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -314,6 +314,16 @@ int disassemble_map(vector pathvec, char
> *params, struct multipath *mpp,
>  			}
> 
>  			if (!pp) {
> +				/* daemon should keep same with pathvec
> */
> +				/* pp is not find in pathvec, skip it
> */
> +				if (is_daemon) {
> +					FREE(word);
> +					for (k = 0; k < num_paths_args;
> k++) {
> +						p += get_word(p, NULL);
> +					}
> +					continue;
> +				}
> +
>  				pp_unfound = 1;
>  				pp = alloc_path();
> 
> @@ -326,8 +336,8 @@ int disassemble_map(vector pathvec, char *params,
> struct multipath *mpp,
>  					strncpy(pp->wwid, mpp->wwid,
>  						WWID_SIZE - 1);
>  				}
> -				/* Only call this in multipath client
> mode */
> -				if (!is_daemon && store_path(pathvec,
> pp)) {
> +
> +				if (store_path(pathvec, pp)) {
>  					free_path(pp);
>  					goto out1;
>  				}
> --
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

