Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F259EA84
	for <lists+dm-devel@lfdr.de>; Tue, 23 Aug 2022 20:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661278031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F9UT6osm4G4+cs4deaNHBkSVz7cprZ8+fXG1u/TQ4Qo=;
	b=YhX1rYQwHlvYsWhgL35QS3Zs04ZO6Qv2gC87CCbRTa8WZ4bMU7Is081tpEy/wxwp0rp2WF
	sEhw8ClzirVHShPmTJ/llbtiE/QJVoVeTKFVUsG0ZxeThMd5K25HY4GZX5JYoDB4SGhVaF
	NocDeAjWhNGAT2pn/tZQchbBNPUthmM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-rOevmUW9M4e57NgFChREQg-1; Tue, 23 Aug 2022 14:07:09 -0400
X-MC-Unique: rOevmUW9M4e57NgFChREQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60EE218812C0;
	Tue, 23 Aug 2022 18:07:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E79A14152E0;
	Tue, 23 Aug 2022 18:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93A931946A5E;
	Tue, 23 Aug 2022 18:06:57 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEE621946A40
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 Aug 2022 18:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2355C15BBA; Tue, 23 Aug 2022 18:06:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
 (agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB52DC15BB3;
 Tue, 23 Aug 2022 18:06:55 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
 from userid 3883)
 id F2CED424F087; Tue, 23 Aug 2022 19:06:46 +0100 (BST)
Date: Tue, 23 Aug 2022 19:06:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: dm-devel@redhat.com
Message-ID: <20220823180646.GA79342@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: dm-devel@redhat.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] dm-devel mailing list messages not sent to everyone last
 week
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
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some curious happenings led to the configuration and membership
of the dm-devel mailing list getting wound back to its state in 2004
just over a week ago.  It was restored yesterday, but you might want to
look at the list archives to check for any messages you missed:

  https://listman.redhat.com/archives/dm-devel/2022-August/date.html

Longer version.

In 2001, mailman introduced some code to change the format in which
it stored its list information.  It took a few years for this
to reach deployed distros.  It stored the new data for each list under a
new filename.  Its code looks first for the new file and if it's not
there, uses the old one and converts it into the new format.  After it
has run, the new file will be present so it will just use that from
then on.

Crucially, if the new file is present but it fails to read its contents
successfully, it also falls back and uses the old file if it can.  (I'm
guessing this was so it could handle interruption during conversion
transparently.) 

The old file was still present for the dm-devel mailing list, and after
a reboot on 11th August, the system was unable to read the current file
(and its backup) and fell back to using the file from 2004, reconverting
it!

People started reporting some odd problems with the mailing list but it
took several days for us to realise what was going on.  We don't know
the root cause of the corruption but are continuing to investigate.

Lessons so far:
1. If you code a transparent upgrade mechanism, make sure it can only
get triggered once, so it cannot repeat itself at a random time many
years later.

2. If you get an error processing a data file, it might be better just
to stop rather than to assume continuing on with an older copy will be
just fine.

3. Make full use of atomic filesystem transactions when updating files
and don't disregard the need to flush in all the right places.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

