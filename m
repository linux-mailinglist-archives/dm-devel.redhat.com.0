Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB27BD3E9
	for <lists+dm-devel@lfdr.de>; Mon,  9 Oct 2023 08:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696834623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mi5YqntSPZsj1MB6BgoSmtBIt6ne5P7kIQOtbEy+38E=;
	b=henPbhx/4cgjuYFjNax30qQsHzaycwGjqe0YnJ/NnEh5T0TZe8iEBDZL+CwGgGRQ55+GF4
	J/+I2ldEZMIxUazFkTVzNEuk2qLd5FP3sihz7WJcNgVJ9SxryJ5OXIWIMes98PeboTRAaR
	8uC6HJfqETFa7wbvAQ0RgcxP90F7b8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-2QFlSZm_P2iCTkJgV2pBmw-1; Mon, 09 Oct 2023 02:57:01 -0400
X-MC-Unique: 2QFlSZm_P2iCTkJgV2pBmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ECA48115B1;
	Mon,  9 Oct 2023 06:56:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51C7D167F8;
	Mon,  9 Oct 2023 06:56:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1915219465B9;
	Mon,  9 Oct 2023 06:56:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 787BC194658C
 for <dm-devel@listman.corp.redhat.com>; Mon,  9 Oct 2023 00:40:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5669F140E963; Mon,  9 Oct 2023 00:40:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3EB140E953
 for <dm-devel@redhat.com>; Mon,  9 Oct 2023 00:40:41 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0341C811E7B
 for <dm-devel@redhat.com>; Mon,  9 Oct 2023 00:40:41 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-y6oy9PFpOG686qX-X_y9vw-1; Sun,
 08 Oct 2023 20:40:39 -0400
X-MC-Unique: y6oy9PFpOG686qX-X_y9vw-1
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w1.tutanota.de (Postfix) with ESMTP id 2A698FBFB2C
 for <dm-devel@redhat.com>; Mon,  9 Oct 2023 00:35:26 +0000 (UTC)
Date: Mon, 9 Oct 2023 02:35:26 +0200 (CEST)
From: charlesfdotz@tutanota.com
To: Dm Devel <dm-devel@redhat.com>
Message-ID: <NgGkmIX--3-9@tutanota.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Mon, 09 Oct 2023 06:56:53 +0000
Subject: [dm-devel] Feature Request: Device Manager Fake Trim / Zero Trim
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: tutanota.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I would like to request a new device manager layer be added that accepts trim requests for sectors and instead writes zeros to those sectors.

This would be useful to deal with SMR (shingled magnetic recording) drives that do not support trim. Currently after an SMR drive has had enough data written to it the performance drops dramatically because the disk must shuffle around data as if it were full and without trim support there is no way to inform the disk which sectors are no longer used. Currently there's no way to "fix" or reset this without doing an ATA secure erase despite many of these disk being sold without informing customers that they were SMR drives (western digital was sued for selling SMR drives as NAS drives).

However it seems that some of these drives are smart enough to mark sectors as unused if a sector is filled with zeros (https://old.reddit.com/r/DataHoarder/comments/g7lqaz/). So I think a device mapper that could emulate trim on these devices by simply accepting trim requests then filling those sectors with zeros. It would make a whole class of hard drives significantly more usable.

Sincerely,
Chuck

P.S. I was directed here after mailing the cryptsetup mailing list so I hope this is the right place to ask about this. Thank you.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

