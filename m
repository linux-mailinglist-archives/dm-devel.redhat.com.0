Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 62C2926D7DE
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 11:41:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-LXYu0SOyMMmLxG0rI5FfXw-1; Thu, 17 Sep 2020 05:41:34 -0400
X-MC-Unique: LXYu0SOyMMmLxG0rI5FfXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB929195D563;
	Thu, 17 Sep 2020 09:41:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB0C19D7C;
	Thu, 17 Sep 2020 09:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00537183D041;
	Thu, 17 Sep 2020 09:41:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H9fMKq012678 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 05:41:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51DA910F046; Thu, 17 Sep 2020 09:41:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9A7F41AC
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:41:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3310B101A53F
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:41:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-406-YDqckKbEPXaPCc54JbMKog-1;
	Thu, 17 Sep 2020 05:41:15 -0400
X-MC-Unique: YDqckKbEPXaPCc54JbMKog-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6C92AFE5;
	Thu, 17 Sep 2020 09:41:47 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id B26A41E12E1; Thu, 17 Sep 2020 11:41:13 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:41:13 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917094113.GH7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 01/12] fs: remove the unused SB_I_MULTIROOT
	flag
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:21, Christoph Hellwig wrote:
> The last user of SB_I_MULTIROOT is disappeared with commit f2aedb713c28
> ("NFS: Add fs_context support.")
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Nice. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
> ---
>  fs/namei.c         | 4 ++--
>  include/linux/fs.h | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index e99e2a9da0f7de..f1eb8ccd2be958 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -568,8 +568,8 @@ static bool path_connected(struct vfsmount *mnt, struct dentry *dentry)
>  {
>  	struct super_block *sb = mnt->mnt_sb;
>  
> -	/* Bind mounts and multi-root filesystems can have disconnected paths */
> -	if (!(sb->s_iflags & SB_I_MULTIROOT) && (mnt->mnt_root == sb->s_root))
> +	/* Bind mounts can have disconnected paths */
> +	if (mnt->mnt_root == sb->s_root)
>  		return true;
>  
>  	return is_subdir(dentry, mnt->mnt_root);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 7519ae003a082c..fbd74df5ce5f34 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1385,7 +1385,6 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
>  #define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
>  #define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
> -#define SB_I_MULTIROOT	0x00000008	/* Multiple roots to the dentry tree */
>  
>  /* sb->s_iflags to limit user namespace mounts */
>  #define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

