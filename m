Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1BF181F58
	for <lists+dm-devel@lfdr.de>; Wed, 11 Mar 2020 18:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583947532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ST4L27br4+3ElslMfCrc18gNgo+V8sKZUVCX+nAuI/M=;
	b=Nt8WD7raIn13wXGOL8DikhFFwfqW+dk5YNkqs9x6jR4RqzbpxJBeRwxyI7HjuuyTrksE3l
	lVt+QezdUUnvl3PgJnnZCP/l7/ZF2r5qEF/nCjSfXoVliVC2XiAEhVQeD9NPRbpq9kMFdm
	MD27g7Ag4plL8H6npo2zh57R9jzx0tI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-wJI4okaeN32H2WbFYC4Blw-1; Wed, 11 Mar 2020 13:25:28 -0400
X-MC-Unique: wJI4okaeN32H2WbFYC4Blw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D5A6DBAA;
	Wed, 11 Mar 2020 17:25:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03E7F60BF1;
	Wed, 11 Mar 2020 17:25:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCBEA86A20;
	Wed, 11 Mar 2020 17:24:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02BHOf4w018955 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Mar 2020 13:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 145CB10A58DD; Wed, 11 Mar 2020 17:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFBF10A58DA
	for <dm-devel@redhat.com>; Wed, 11 Mar 2020 17:24:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7C98001E4
	for <dm-devel@redhat.com>; Wed, 11 Mar 2020 17:24:38 +0000 (UTC)
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
	[134.119.228.99]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-7U-mlxBkObaevN0Xy0y2RA-1; Wed, 11 Mar 2020 13:24:35 -0400
X-MC-Unique: 7U-mlxBkObaevN0Xy0y2RA-1
Received: from [134.119.228.2] (helo=webmailfront-cgn01.ispgateway.de)
	by smtprelay07.ispgateway.de with esmtpsa
	(TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.3)
	(envelope-from <maiski@maiski.net>) id 1jC55u-0007KG-81
	for dm-devel@redhat.com; Wed, 11 Mar 2020 18:24:34 +0100
Received: from 94.134.88.88 ([94.134.88.88]) by webmail.df.eu (Horde
	Framework) with HTTP; Wed, 11 Mar 2020 18:24:34 +0100
Date: Wed, 11 Mar 2020 18:24:33 +0100
Message-ID: <20200311182433.Horde.h5NgeQO8h7MdvZTOX37pPw2@webmail.df.eu>
From: maiski@maiski.net
To: dm-devel@redhat.com
User-Agent: Internet Messaging Program (IMP) H5 (6.0.4)
MIME-Version: 1.0
X-Df-Sender: bWFpc2tpQG1haXNraS5uZXQ=
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02BHOf4w018955
X-loop: dm-devel@redhat.com
Subject: [dm-devel] probable lvm thin_pool exhaustion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hello all,

i am a total newbie besides the general knowledge of lvm.
With this disclaimer written I have the following problem,
which may def need some expert knowledge of lvm, because i couldn't
find solutions online for now :/

I am booting my system (in my case is Qubes, but I suppose that does  
not matter at this point)
and after entering my luks password get to the dracut emergency shell.
"Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!"
The only aclive lv is qubes_dom0/swap.
All the others are inactive.

step 1:
lvm vgscan vgchange -ay
lvm lvconvert --repair qubes_dom0/pool00
Result:
using default stripesize 64.00 KiB.
Terminate called after throwing an instance of 'std::runtime_error'
what(): transaction_manager::new_block() couldn't allocate new block
Child 7212 exited abnormally
Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed  
(status:1). Manual repair required!

step 2:
since i suspect that my lvm is full (though it does mark 15 g as free)
i tried the following changes in the /etc/lvm/lvm.conf
thin_pool_autoextend_threshold = 80
thin_pool_autoextend_percent = 2 (Since my the pvs output gives PSize:  
465.56g Pfree 15.78g, I set this to 2% to be overly cautious not to  
extend beyond the 15 G marked as free, since idk)
auto_activation_volume_list = to hold the group, root, pool00, swap  
and a vm that would like to delete to free some space
volume_list = the same as auto_activation_volume_list

and tried step 1 again, did not work, got the same result as above  
with qubes_swap as active only

step 3 tried
lvextend -L+1G qubes_dom0/pool00_tmeta
Result:
metadata reference count differ for block xxxxxx, expected 0, but got 1 ...
Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!


Since I do not know my way around lvm, what do you think, would be the  
best way out of this?
Adding another external PV? migrating to a bigger PV?
I did not play with backup or achive out of fear to loose any  
unbackuped data which happens to be a bit :|
Any help will be highly appreciated!

Thanks in advance,
m


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

