Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BEF1F861
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 18:21:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF55E89C46;
	Wed, 15 May 2019 16:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A728C5D9C2;
	Wed, 15 May 2019 16:21:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 965DF4BB43;
	Wed, 15 May 2019 16:21:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FGKv12024399 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 12:20:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCFBE608AC; Wed, 15 May 2019 16:20:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54516608B9;
	Wed, 15 May 2019 16:20:55 +0000 (UTC)
Date: Wed, 15 May 2019 12:20:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Helen Koike <helen.koike@collabora.com>
Message-ID: <20190515162054.GA14934@redhat.com>
References: <20190513192530.1167-1-helen.koike@collabora.com>
	<20190514013716.GA10260@lobo>
	<78dda04b-925f-49eb-f88a-6d940bcc4754@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78dda04b-925f-49eb-f88a-6d940bcc4754@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm ioctl: fix hang in early create error condition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 15 May 2019 16:21:03 +0000 (UTC)

On Wed, May 15 2019 at 12:12pm -0400,
Helen Koike <helen.koike@collabora.com> wrote:

> Hi,
> 
> On 5/13/19 10:37 PM, Mike Snitzer wrote:
> > On Mon, May 13 2019 at  3:25P -0400,
> > Helen Koike <helen.koike@collabora.com> wrote:
> > 
> >> The dm_early_create() function (which deals with "dm-mod.create=" kernel
> >> command line option) calls dm_hash_insert() who gets an extra reference
> >> to the md object.
> >>
> >> In case of failure, this reference wasn't being released, causing
> >> dm_destroy() to hang, thus hanging the whole boot process.
> >>
> >> Fix this by calling __hash_remove() in the error path.
> >>
> >> Fixes: 6bbc923dfcf57d ("dm: add support to directly boot to a mapped device")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>
> >> ---
> >> Hi,
> >>
> >> I tested this patch by adding a new test case in the following test
> >> script:
> >>
> >> https://gitlab.collabora.com/koike/dm-cmdline-test/commit/d2d7a0ee4a49931cdb59f08a837b516c2d5d743d
> >>
> >> This test was failing, but with this patch it works correctly.
> >>
> >> Thanks
> >> Helen
> > 
> > Thanks for the patch but I'd prefer the following simpler fix.  What do
> > you think?
> > 
> > That said, I can provide a follow-on patch (inspired by the patch you
> > provided) that encourages more code sharing between dm_early_create()
> > and dev_create() by factoring out __dev_create().
> 
> Sounds great.
> 
> > 
> > diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> > index c740153b4e52..0eb0b462c736 100644
> > --- a/drivers/md/dm-ioctl.c
> > +++ b/drivers/md/dm-ioctl.c
> > @@ -2117,6 +2117,7 @@ int __init dm_early_create(struct dm_ioctl *dmi,
> >  err_destroy_table:
> >  	dm_table_destroy(t);
> >  err_destroy_dm:
> > +	(void) __hash_remove(__find_device_hash_cell(dmi));
> >  	dm_put(md);
> >  	dm_destroy(md);
> >  	return r;
> > 
> 
> This doesn't really work for two reasons:
> 
> 1) __find_device_hash_cell() requires a mutual exclusivity between name,
> uuid and dev. In dm_early_create(), dmi can have more then one of these.

__find_device_hash_cell's exclusivity requirements are strange; I'll try
to understand what requires this.

> 2) I can fix (1) by calling __get_name_cell(), as the name is mandatory
> anyway, but this function also grabs another reference to the md object,
> so I need to add an extra dm_put(md) there:
> 
>  err_destroy_table:
>         dm_table_destroy(t);
> +err_hash_remove:
> +       (void) __hash_remove(__get_name_cell(dmi->name));
> +       dm_put(md);
>  err_destroy_dm:
>         dm_put(md);
>         dm_destroy(md);
> 
> 
> What do you think? Is this ok?

I think so.  Please submit a v2 and I'll rebase my followon patch
accordingly and will get it posted.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
