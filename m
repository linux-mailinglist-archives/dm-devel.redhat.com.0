Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC9C2F6622
	for <lists+dm-devel@lfdr.de>; Thu, 14 Jan 2021 17:45:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-LgkvXjFPO-iIGVpHcXrwaQ-1; Thu, 14 Jan 2021 11:45:23 -0500
X-MC-Unique: LgkvXjFPO-iIGVpHcXrwaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61640107ACF7;
	Thu, 14 Jan 2021 16:45:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 202275D9EF;
	Thu, 14 Jan 2021 16:45:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88DEF4BB7B;
	Thu, 14 Jan 2021 16:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EGifSB009444 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 11:44:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADBDE2026D14; Thu, 14 Jan 2021 16:44:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C862026D12
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 16:44:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 727A485828A
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 16:44:39 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-MAW5UUjPOAWCU2DUsnENag-1; Thu, 14 Jan 2021 11:44:37 -0500
X-MC-Unique: MAW5UUjPOAWCU2DUsnENag-1
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	10EGgr0c055922; Thu, 14 Jan 2021 11:44:36 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 362sqbr128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 14 Jan 2021 11:44:36 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10EGh70j056353;
	Thu, 14 Jan 2021 11:44:36 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.108])
	by mx0b-001b2d01.pphosted.com with ESMTP id 362sqbr11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 14 Jan 2021 11:44:36 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	10EGbVht003453; Thu, 14 Jan 2021 16:44:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 35y448be54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 14 Jan 2021 16:44:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 10EGiQUF33161524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Jan 2021 16:44:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE11E4C046;
	Thu, 14 Jan 2021 16:44:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C3244C04E;
	Thu, 14 Jan 2021 16:44:28 +0000 (GMT)
Received: from sig-9-65-209-51.ibm.com (unknown [9.65.209.51])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 14 Jan 2021 16:44:28 +0000 (GMT)
Message-ID: <99be76345f375bb2f485f08a53dcb8ed806dc538.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Paul Moore
	<paul@paul-moore.com>, Sasha Levin <sashal@kernel.org>
Date: Thu, 14 Jan 2021 11:44:27 -0500
In-Reply-To: <fc80b1a1-ff4d-3bf2-59bd-2cb56135bf0f@linux.microsoft.com>
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
	<20210108040708.8389-9-tusharsu@linux.microsoft.com>
	<CAHC9VhSJk0wG=WzO3bwsueiy19mMi9m6MamTrQfH8C=gXUtvGw@mail.gmail.com>
	<97328fc71687a0e1c327f6821548be9ba35bb193.camel@linux.ibm.com>
	<CAHC9VhTzaQ_q8gJ0oeok_yJ54XLETNvOuhhKnyRwgqsqvpBLCw@mail.gmail.com>
	<71cddb6c8676ccd63c89364d805cfca76d32cb6e.camel@linux.ibm.com>
	<CAHC9VhRhYWEcK7TepZ=LK1m=9Zn_gtOZyAYfamP-TFU3rRH+zw@mail.gmail.com>
	<e29a618645b0e73ec06960a02b6da465614689ff.camel@linux.ibm.com>
	<CAHC9VhTHqwKem=MyQBY4TNAq-DOVhwEZS8pjrSE=4OxdEVm-GA@mail.gmail.com>
	<3746bc7673df25354411151442a7772b867be396.camel@linux.ibm.com>
	<fc80b1a1-ff4d-3bf2-59bd-2cb56135bf0f@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2021-01-14_05:2021-01-14,
	2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
	impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
	phishscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2101140091
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	casey@schaufler-ca.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v10 8/8] selinux: include a consumer of the
 new IMA critical data hook
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[Cc'ing Sasha]

Hi Lakshmi,

On Thu, 2021-01-14 at 08:22 -0800, Lakshmi Ramasubramanian wrote:
> On 1/13/21 6:49 PM, Mimi Zohar wrote:

> >>> Lakshmi is trying to address the situation where an event changes a
> >>> value, but then is restored to the original value.  The original and
> >>> subsequent events are measured, but restoring to the original value
> >>> isn't re-measured.  This isn't any different than when a file is
> >>> modified and then reverted.
> >>>
> >>> Instead of changing the name like this, which doesn't work for files,
> >>> allowing duplicate measurements should be generic, based on policy.
> >>
> >> Perhaps it is just the end of the day and I'm a bit tired, but I just
> >> read all of the above and I have no idea what your current thoughts
> >> are regarding this patch.
> > 
> > Other than appending the timestamp, which is a hack, the patch is fine.
> > Support for re-measuring an event can be upstreamed independently.
> > 
> 
> Thanks for clarifying the details related to duplicate measurement 
> detection and re-measuring.
> 
> I will keep the timestamp for the time being, even though its a hack, as 
> it helps with re-measuring state changes in SELinux. We will add support 
> for "policy driven" re-measurement as a subsequent patch series.

Once including the timestamp is upstreamed, removing it will be
difficult, especially if different userspace applications are dependent
on it.  Unless everyone is on board that removing the timestamp
wouldn't be considered a regression, it cannot be upstreamed.

thanks,

Mimi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

