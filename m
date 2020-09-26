Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDC53279BFE
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 21:03:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-2_qnSsG2P3OO--FLDs0D1A-1; Sat, 26 Sep 2020 15:03:05 -0400
X-MC-Unique: 2_qnSsG2P3OO--FLDs0D1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94958186DD20;
	Sat, 26 Sep 2020 19:02:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA25E1002C21;
	Sat, 26 Sep 2020 19:02:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B96444A50;
	Sat, 26 Sep 2020 19:02:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08QJ2kJY001511 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 15:02:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A59B694655; Sat, 26 Sep 2020 19:02:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A053E94654
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 19:02:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488C3800296
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 19:02:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-525-b9LJZXevOU-wJbmaRVTaNg-1;
	Sat, 26 Sep 2020 15:02:41 -0400
X-MC-Unique: b9LJZXevOU-wJbmaRVTaNg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0B011ACBF;
	Sat, 26 Sep 2020 19:02:40 +0000 (UTC)
Message-ID: <bb1c3bce184dae7dc6148417aae115a87658a28c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Frank Meinl <frank.meinl@live.de>, dm-devel@redhat.com
Date: Sat, 26 Sep 2020 21:02:39 +0200
In-Reply-To: <AM0PR09MB2897B99544634CA56DA930D1FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
References: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<AM0PR09MB2897B99544634CA56DA930D1FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 2/2] multipath: Extend program description
	in manpage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-26 at 18:29 +0200, Frank Meinl wrote:
> Add two paragraphs which list some advantages of multipath and
> explain
> the benefit for single path devices. The text has been partly
> composed
> by Benjamin Marzinski. - Refer to
> https://www.redhat.com/archives/dm-devel/2020-September/msg00431.html
> 
> Signed-off-by: Frank Meinl <frank.meinl@live.de>

Hm, this was not what I meant. multipath(8) is not the man page of the
dm-multipath kernel feature, it's the man page of the tool "multipath".
USB disks could just as well be set up using "multipathd". This text is
too generic and doesn't fit into multipath(8), neither generally nor
wrt style.

We don't have a man page about dm-multipath itself, and as nobody has
asked for it in 15 years, perhaps it's a bit late now to start one.

I know I asked you to do this, but thinking about it now, if you don't
mind, let's just leave it at the first patch.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

