Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B741B7B58A
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 00:16:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7954D3082A8B;
	Tue, 30 Jul 2019 22:16:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A71091001281;
	Tue, 30 Jul 2019 22:16:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCEDC264CA;
	Tue, 30 Jul 2019 22:15:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UMFnxf027795 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 18:15:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61E405C1B4; Tue, 30 Jul 2019 22:15:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0C965C1A1;
	Tue, 30 Jul 2019 22:15:44 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AE4F3084025;
	Tue, 30 Jul 2019 22:15:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z3so12963479iog.0;
	Tue, 30 Jul 2019 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eJWTXDTsE+z8vuI+3+Qq5diLIDrFR4TuvgdInaKarkA=;
	b=cceTkrjEHo1IVeZWBhk/wi74szSDUuElNWxyWZ9zgPfMQsj0xiNXErA4Ip3Qub2NBU
	aK4zcsxJNL6yGDgvSNU4l3Dz8p2FASqASrIQngRH42ly+ZJJqCt6XF2xW52MHu7UyE6p
	/qljE1Oj+8Hjta/HXbKN3wqKEcRZfGei88rf8iNgT7t2YFZjuQyrUk1M/3r9a/Ne5DgG
	xm3Y9plTVZiAtnbOymCCpefjPufDwpHrSG2ANlrYGA3l6sHpmVoWZ0O7E5S5eeNqDQAr
	O/dUdT8JMSKBvLqkbnYTYSxSfwZlgaTSpI2fbAgOXvGYwBcduzOGfRVbK1ZlIX6bCno2
	JFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eJWTXDTsE+z8vuI+3+Qq5diLIDrFR4TuvgdInaKarkA=;
	b=abvv4Kqie391ZpoqtzPVq9TMgvQnYBENjNq2pWfmkLrAoCgmwAnKni61oj0NcxyPLy
	z+weVWv6QfUXwegsElL8kx/3rI9Z9aozTBcuyvhmn/HozEZWxfwcKymtzTAsxvjBiuyN
	GKnGru6wSGZq3os0IVcw3B9sCXOOgwScwZn+L+WejHs78ctWMueRU5pd5TphAjz1xThW
	6jS84do9cD+SNPO1ZaC0mH2kinVnadEQZfTSHFICb3ySKWlfVkAw1SpROAxnZP1kyyOI
	SRqtbGxGJJJj9GZxfOSLmejpTjoXKyxZTTQoLvqjOlQqv2+y3GQZdnZhMUYi/3/JQgfT
	+A9g==
X-Gm-Message-State: APjAAAXPxjf1FXQe3wh4gsg6Sl/5WEfGW4KlWjFIdOGB5J8E9e9ZaD+B
	YJd1aEEYWJhAn02Sd1BHHh25bZQTHiGysfb1o4b/mQ==
X-Google-Smtp-Source: APXvYqzacbhzX6CmRaif1jdwGFgTYO3dYaLxT/41iTKcLbynfkFATjOsa1NpAW9so1aVjlBxmgqjRRu36ogOi52OC3g=
X-Received: by 2002:a02:662f:: with SMTP id k47mr121858178jac.4.1564524941279; 
	Tue, 30 Jul 2019 15:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190730113708.14660-1-pagupta@redhat.com>
	<2030283543.5419072.1564486701158.JavaMail.zimbra@redhat.com>
	<20190730190737.GA14873@redhat.com>
	<CAPcyv4i10K3QdSwa3EF9t8pS-QrB9YcBEMy49N1PnYQzCkBJCw@mail.gmail.com>
	<20190730220102.GA15604@redhat.com>
In-Reply-To: <20190730220102.GA15604@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jul 2019 15:15:30 -0700
Message-ID: <CAA9_cmd8to1108H+osSuyyRriX50-g1YV3YebJ=PNsKbW0NPFw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 30 Jul 2019 22:15:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 30 Jul 2019 22:15:43 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'dan.j.williams@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.251  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <dan.j.williams@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] dm: fix dax_dev NULL dereference
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 30 Jul 2019 22:16:03 +0000 (UTC)

On Tue, Jul 30, 2019 at 3:01 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Tue, Jul 30 2019 at  5:38pm -0400,
> Dan Williams <dan.j.williams@intel.com> wrote:
>
> > On Tue, Jul 30, 2019 at 12:07 PM Mike Snitzer <snitzer@redhat.com> wrote:
> > >
> > > I staged the fix (which I tweaked) here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.3&id=95b9ebb78c4c733f8912a195fbd0bc19960e726e
> >
> > Thanks for picking this up Mike, but I'd prefer to just teach
> > dax_synchronous() to return false if the passed in dax_dev is NULL.
> > Thoughts?
>
> I considered that too but I moved away from it because I'm so used to
> the various block interfaces requiring the caller pass a non-NULL
> pointer (e.g. request_queue):
>
> $ grep -ri return drivers/md/dm-table.c | grep \&\&
> drivers/md/dm-table.c:        return dev->dax_dev && dax_synchronous(dev->dax_dev);
> drivers/md/dm-table.c:        return q && blk_queue_zoned_model(q) == *zoned_model;
> drivers/md/dm-table.c:        return q && blk_queue_zone_sectors(q) == *zone_sectors;
> drivers/md/dm-table.c:        return q && (q->queue_flags & flush);
> drivers/md/dm-table.c:        return q && blk_queue_nonrot(q);
> drivers/md/dm-table.c:        return q && !blk_queue_add_random(q);
> drivers/md/dm-table.c:        return q && !q->limits.max_write_same_sectors;
> drivers/md/dm-table.c:        return q && !q->limits.max_write_zeroes_sectors;
> drivers/md/dm-table.c:        return q && !blk_queue_discard(q);
> drivers/md/dm-table.c:        return q && !blk_queue_secure_erase(q);
> drivers/md/dm-table.c:        return q && bdi_cap_stable_pages_required(q->backing_dev_info);
>
> I'm fine with however you'd like to skin this cat though.
>
> Just let me know and I'll keep/drop this patch accordingly.

Ok, since you've already got it queued, and there are no other
required "if (!dax_dev)" fixups go ahead with what you have.

    Acked-by: Dan Williams <dan.j.williams@intel.com>

I just reserve the right to go push it down a level if the kernel ever
grows more dax_synchronous() users that do that safety check.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
